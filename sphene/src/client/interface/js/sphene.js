class Sphene {
  static #callbackHashes = {};
  static #events = {};

  static version = {
    major: 0,
    minor: 1,
    patch: 0,
    build: "dev-4"
  };

  static settings = {
    
  }

  static environment = 'simulated';
  static debugMode = {{ debugMode }};

  static debug = new Debug();

  static quit() {

  }

  static registerEvent(eventName, callback) {
    if (this.#events[eventName] == null) {
      this.#events[eventName] = [];
    }

    for (let index in this.#events[eventName]) {
      if (this.#events[eventName][index] == callback) {
        return false;
      }
    }

    this.#events[eventName].push(callback);

    return true;
  }

  static unregisterEvent(eventName, callback = null) {
    if (this.#events[eventName] != null) {
      if (callback != null) {
        for (let index in this.#events[eventName]) {
          if (this.#events[eventName][index] == callback) {
            this.#events[eventName].splice(index, 1);
            return true;
          }
        }
      } else {
        delete this.#events[eventName];
        return true;
      }
    }

    return false;
  }

  static triggerEvent(eventName, ...vars) {
    for (let index in this.#events[eventName]) {
      this.#events[eventName][index].apply(null, vars);
    }
  }

  static startBenchmark() {
    mta.triggerEvent("sphene:benchmark:start");
  }

  static fetchBenchmarkLeaderboard(type) {
    return this.promiseCallback("sphene:benchmark:leaderboard:fetch", "onBenchmarkLeaderboardDataReceived", "onBenchmarkLeaderboardDataError", type);
  }

  static fetchBenchmarkLegacyLeaderboard(type) {
    return this.promiseCallback("sphene:benchmark:leaderboard:fetch", "onBenchmarkLeaderboardDataReceived", "onBenchmarkLeaderboardDataError", type, true);
  }

  static fetchBenchmarkHistory(type) {
    return this.promiseCallback("sphene:benchmark:history:fetch", "onBenchmarkHistoryDataReceived", "onBenchmarkHistoryDataError", type);
  }

  static quit() {
    mta.triggerEvent("sphene:quit");
  }

  static cleanHashes() {
    for (let hash in this.#callbackHashes) {
      if (Date.now() - this.#callbackHashes[hash]['time'] > 60000) {
        if (this.#callbackHashes[hash]['callback'] != null) {
          for (let eventName in this.#events) {
            for (let index in this.#events[eventName]) {
              if (this.#events[eventName][index] == this.#callbackHashes[hash]['callback']) {
                this.#events[eventName].splice(index, 1);
              }
            }
          }
        }
  
        delete this.#callbackHashes[hash];
      }
    }
  }

  static promiseCallback(mtaEvent, returnEvent, errorEvent, ...vars) {
    return new Promise((resolve, reject) => {
      var callback = null;
      var errorCallback = null;
      var hash = null;

      do {
        hash = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
      } while (this.#callbackHashes[hash] != null);

      callback = (checkHash, data) => {
        if (checkHash == hash) {
          Sphene.unregisterEvent(returnEvent, callback);
          Sphene.unregisterEvent(errorEvent, errorCallback);
          resolve(data);
        }
      };

      errorCallback = (checkHash, data) => {
        if (checkHash == hash) {
          Sphene.unregisterEvent(returnEvent, callback);
          Sphene.unregisterEvent(errorEvent, errorCallback);
          reject(data);
        }
      };

      this.#callbackHashes[hash] = {
        time: Date.now(),
        callback: callback
      };

      Sphene.registerEvent(returnEvent, callback);
      Sphene.registerEvent(errorEvent, errorCallback);
      mta.triggerEvent(mtaEvent, hash, ...vars);
    });
  }
}

setInterval(Sphene.cleanHashes.bind(Sphene), 1000);