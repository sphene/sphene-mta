class Debug {
  getFramesDebugData() {
    return Sphene.promiseCallback("sphene:debug:frames:get", "onDebugFramesReceived", "onDebugFramesError");
  }

  runConsoleCode(code) {
    return Sphene.promiseCallback("sphene:debug:console:run", "onDebugConsoleCodeExecuted", "onDebugConsoleCodeError", code);
  }
}