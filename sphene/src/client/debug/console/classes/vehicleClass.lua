-----------------------------------
-- * Variables
-----------------------------------

VehicleClass = {}
VehicleClass.__index = VehicleClass

-----------------------------------
-- * Functions
-----------------------------------

function VehicleClass.create(runtime, model, x, y, z, rotX, rotY, rotZ)
    local mt = setmetatable({}, VehicleClass)

    mt.runtime = runtime

    if (mt:__instanceof(x, Vector3Class)) then
        if (mt:__instanceof(y, Vector3Class)) then
            local vector = y
            rotX = vector:getX(runtime).value
            rotY = vector:getY(runtime).value
            rotZ = vector:getZ(runtime).value
        end

        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    else
        if (mt:__instanceof(rotX, Vector3Class)) then
            local vector = rotX
            rotX = vector:getX(runtime).value
            rotY = vector:getY(runtime).value
            rotZ = vector:getZ(runtime).value
        end
    end

    mt.vehicle = VehicleElement:create(model)
    mt.vehicle:spawn(x, y, z, rotX, rotY, rotZ)

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function VehicleClass.__createFromPointer(runtime, vehiclePointer)
    local mt = setmetatable({}, VehicleClass)

    mt.runtime = runtime
    mt.vehicle = vehiclePointer

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function VehicleClass:__initializeProperties()
    self.properties = {
        model = 'getModel',
        position = 'getPosition',
        rotation = 'getRotation',
        matrix = 'getMatrix'
    }
end

function VehicleClass:destroy(_)
    self.vehicle:destroy()
end

function VehicleClass:setPosition(runtime, x, y, z)
    if (self:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.vehicle:setPosition(x, y, z)
end

function VehicleClass:setRotation(runtime, x, y, z)
    if (self:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.vehicle:setRotation(x, y, z)
end

function VehicleClass:setModel(_, model)
    self.vehicle:setModel(model)
end

function VehicleClass:setFrozen(_, frozen)
    self.vehicle:setFrozen(frozen)
end

function VehicleClass:attachTrailer(_, attachToVehicle)
    if (self:__instanceof(attachToVehicle, VehicleClass)) then
        self.vehicle:attachTrailer(attachToVehicle.vehicle)
    end
end

function VehicleClass:detachTrailer(_)
    self.vehicle:detachTrailer()
end

function VehicleClass:getModel(_)
    return self.runtime:returnNumber(self.vehicle:getModel())
end

function VehicleClass:getPosition(_)
    return Vector3Class.create(self.runtime, self.vehicle:getPosition())
end

function VehicleClass:getRotation(_)
    return Vector3Class.create(self.runtime, self.vehicle:getRotation())
end

function VehicleClass:getMatrix(_)
    return MatrixClass.create(self.runtime, self:getPosition():getObject(), self:getRotation():getObject())
end

function VehicleClass:getOccupant(_, seat)
    local occupant = self.vehicle:getOccupant(seat)

    if (not occupant) then
        return self.runtime:returnBoolean(false)
    end

    return ActorClass.__createFromPointer(self.runtime, occupant)
end

function VehicleClass:__tostring()
    local x, y, z = self.vehicle:getPosition()
    local model = self.vehicle:getModel()

    return "Vehicle<"..tostring(model)..", "..tostring(x)..", "..tostring(y)..", "..tostring(z)..">"
end

function VehicleClass.__preinit(runtime)
    VehicleClass.identifiers = {
        LANDSTALKER = NumberNode:create(runtime, 400),
        BRAVURA = NumberNode:create(runtime, 401),
        BUFFALO = NumberNode:create(runtime, 402),
        LINERUNNER = NumberNode:create(runtime, 403),
        PERENNIAL = NumberNode:create(runtime, 404),
        SENTINEL = NumberNode:create(runtime, 405),
        DUMPER = NumberNode:create(runtime, 406),
        FIRETRUCK = NumberNode:create(runtime, 407),
        TRASHMASTER = NumberNode:create(runtime, 408),
        STRETCH = NumberNode:create(runtime, 409),
        MANANA = NumberNode:create(runtime, 410),
        INFERNUS = NumberNode:create(runtime, 411),
        VOODOO = NumberNode:create(runtime, 412),
        PONY = NumberNode:create(runtime, 413),
        MULE = NumberNode:create(runtime, 414),
        CHEETAH = NumberNode:create(runtime, 415),
        AMBULANCE = NumberNode:create(runtime, 416),
        LEVIATHAN = NumberNode:create(runtime, 417),
        MOONBEAM = NumberNode:create(runtime, 418),
        ESPERANTO = NumberNode:create(runtime, 419),
        TAXI = NumberNode:create(runtime, 420),
        WASHINGTON = NumberNode:create(runtime, 421),
        BOBCAT = NumberNode:create(runtime, 422),
        MR_WHOOPEE = NumberNode:create(runtime, 423),
        BF_INJECTION = NumberNode:create(runtime, 424),
        HUNTER = NumberNode:create(runtime, 425),
        PREMIER = NumberNode:create(runtime, 426),
        ENFORCER = NumberNode:create(runtime, 427),
        SECURICAR = NumberNode:create(runtime, 428),
        BANSHEE = NumberNode:create(runtime, 429),
        PREDATOR = NumberNode:create(runtime, 430),
        BUS = NumberNode:create(runtime, 431),
        RHINO = NumberNode:create(runtime, 432),
        BARRACKS = NumberNode:create(runtime, 433),
        HOTKNIFE = NumberNode:create(runtime, 434),
        TRAILER_1 = NumberNode:create(runtime, 435),
        PREVION = NumberNode:create(runtime, 436),
        COACH = NumberNode:create(runtime, 437),
        CABBIE = NumberNode:create(runtime, 438),
        STALLION = NumberNode:create(runtime, 439),
        RUMPO = NumberNode:create(runtime, 440),
        RC_BANDIT = NumberNode:create(runtime, 441),
        ROMERO = NumberNode:create(runtime, 442),
        PACKER = NumberNode:create(runtime, 443),
        MONSTER = NumberNode:create(runtime, 444),
        ADMIRAL = NumberNode:create(runtime, 445),
        SQUALO = NumberNode:create(runtime, 446),
        SEASPARROW = NumberNode:create(runtime, 447),
        PIZZABOY = NumberNode:create(runtime, 448),
        TRAM = NumberNode:create(runtime, 449),
        TRAILER_2 = NumberNode:create(runtime, 450),
        TURISMO = NumberNode:create(runtime, 451),
        SPEEDER = NumberNode:create(runtime, 452),
        REEFER = NumberNode:create(runtime, 453),
        TROPIC = NumberNode:create(runtime, 454),
        FLATBED = NumberNode:create(runtime, 455),
        YANKEE = NumberNode:create(runtime, 456),
        CADDY = NumberNode:create(runtime, 457),
        SOLAIR = NumberNode:create(runtime, 458),
        BERKLEYS_RC_VAN = NumberNode:create(runtime, 459),
        SKIMMER = NumberNode:create(runtime, 460),
        PCJ_600 = NumberNode:create(runtime, 461),
        FAGGIO = NumberNode:create(runtime, 462),
        FREEWAY = NumberNode:create(runtime, 463),
        RC_BARON = NumberNode:create(runtime, 464),
        RC_RAIDER = NumberNode:create(runtime, 465),
        GLENDALE = NumberNode:create(runtime, 466),
        OCEANIC = NumberNode:create(runtime, 467),
        SANCHEZ = NumberNode:create(runtime, 468),
        SPARROW = NumberNode:create(runtime, 469),
        PATRIOT = NumberNode:create(runtime, 470),
        QUADBIKE = NumberNode:create(runtime, 471),
        COASTGUARD = NumberNode:create(runtime, 472),
        DINGHY = NumberNode:create(runtime, 473),
        HERMES = NumberNode:create(runtime, 474),
        SABRE = NumberNode:create(runtime, 475),
        RUSTLER = NumberNode:create(runtime, 476),
        ZR_350 = NumberNode:create(runtime, 477),
        WALTON = NumberNode:create(runtime, 478),
        REGINA = NumberNode:create(runtime, 479),
        COMET = NumberNode:create(runtime, 480),
        BMX = NumberNode:create(runtime, 481),
        BURRITO = NumberNode:create(runtime, 482),
        CAMPER = NumberNode:create(runtime, 483),
        MARQUIS = NumberNode:create(runtime, 484),
        BAGGAGE = NumberNode:create(runtime, 485),
        DOZER = NumberNode:create(runtime, 486),
        MAVERICK = NumberNode:create(runtime, 487),
        NEWS_CHOPPER = NumberNode:create(runtime, 488),
        RANCHER = NumberNode:create(runtime, 489),
        FBI_RANCHER = NumberNode:create(runtime, 490),
        VIRGO = NumberNode:create(runtime, 491),
        GREENWOOD = NumberNode:create(runtime, 492),
        JETMAX = NumberNode:create(runtime, 493),
        HOTRING_RACER = NumberNode:create(runtime, 494),
        SANDKING = NumberNode:create(runtime, 495),
        BLISTA_COMPACT = NumberNode:create(runtime, 496),
        POLICE_MAVERICK = NumberNode:create(runtime, 497),
        BOXVILLE = NumberNode:create(runtime, 498),
        BENSON = NumberNode:create(runtime, 499),
        MESA = NumberNode:create(runtime, 500),
        RC_GOBLIN = NumberNode:create(runtime, 501),
        HOTRING_RACER_2 = NumberNode:create(runtime, 502),
        HOTRING_RACER_3 = NumberNode:create(runtime, 503),
        BLOODRING_BANGER = NumberNode:create(runtime, 504),
        RANCHER_LURE = NumberNode:create(runtime, 505),
        SUPER_GT = NumberNode:create(runtime, 506),
        ELEGANT = NumberNode:create(runtime, 507),
        JOURNEY = NumberNode:create(runtime, 508),
        BIKE = NumberNode:create(runtime, 509),
        MOUNTAIN_BIKE = NumberNode:create(runtime, 510),
        BEAGLE = NumberNode:create(runtime, 511),
        CROPDUSTER = NumberNode:create(runtime, 512),
        STUNTPLANE = NumberNode:create(runtime, 513),
        TANKER = NumberNode:create(runtime, 514),
        ROADTRAIN = NumberNode:create(runtime, 515),
        NEBULA = NumberNode:create(runtime, 516),
        MAJESTIC = NumberNode:create(runtime, 517),
        BUCCANEER = NumberNode:create(runtime, 518),
        SHAMAL = NumberNode:create(runtime, 519),
        HYDRA = NumberNode:create(runtime, 520),
        FCR_900 = NumberNode:create(runtime, 521),
        NRG_500 = NumberNode:create(runtime, 522),
        HPV1000 = NumberNode:create(runtime, 523),
        CEMENT_TRUCK = NumberNode:create(runtime, 524),
        TOWTRUCK = NumberNode:create(runtime, 525),
        FORTUNE = NumberNode:create(runtime, 526),
        CADRONA = NumberNode:create(runtime, 527),
        FBI_TRUCK = NumberNode:create(runtime, 528),
        WILLARD = NumberNode:create(runtime, 529),
        FORKLIFT = NumberNode:create(runtime, 530),
        TRACTOR = NumberNode:create(runtime, 531),
        COMBINE_HARVESTER = NumberNode:create(runtime, 532),
        FELTZER = NumberNode:create(runtime, 533),
        REMINGTON = NumberNode:create(runtime, 534),
        SLAMVAN = NumberNode:create(runtime, 535),
        BLADE = NumberNode:create(runtime, 536),
        FREIGHT = NumberNode:create(runtime, 537),
        BROWN_STREAK = NumberNode:create(runtime, 538),
        VORTEX = NumberNode:create(runtime, 539),
        VINCENT = NumberNode:create(runtime, 540),
        BULLET = NumberNode:create(runtime, 541),
        CLOVER = NumberNode:create(runtime, 542),
        SADLER = NumberNode:create(runtime, 543),
        FIRE_TRUCK_LADDER = NumberNode:create(runtime, 544),
        HUSTLER = NumberNode:create(runtime, 545),
        INTRUDER = NumberNode:create(runtime, 546),
        PRIMO = NumberNode:create(runtime, 547),
        CARGOBOB = NumberNode:create(runtime, 548),
        TAMPA = NumberNode:create(runtime, 549),
        SUNRISE = NumberNode:create(runtime, 550),
        MERIT = NumberNode:create(runtime, 551),
        UTILITY_VAN = NumberNode:create(runtime, 552),
        NEVADA = NumberNode:create(runtime, 553),
        YOSEMITE = NumberNode:create(runtime, 554),
        WINDSOR = NumberNode:create(runtime, 555),
        MONSTER_2 = NumberNode:create(runtime, 556),
        MONSTER_3 = NumberNode:create(runtime, 557),
        URANUS = NumberNode:create(runtime, 558),
        JESTER = NumberNode:create(runtime, 559),
        SULTAN = NumberNode:create(runtime, 560),
        STRATUM = NumberNode:create(runtime, 561),
        ELEGY = NumberNode:create(runtime, 562),
        RAINDANCE = NumberNode:create(runtime, 563),
        RC_TIGER = NumberNode:create(runtime, 564),
        FLASH = NumberNode:create(runtime, 565),
        TAHOMA = NumberNode:create(runtime, 566),
        SAVANNA = NumberNode:create(runtime, 567),
        BANDITO = NumberNode:create(runtime, 568),
        FREIGHT_TRAIN_FLATBED = NumberNode:create(runtime, 569),
        STREAK_TRAIN_TRAILER = NumberNode:create(runtime, 570),
        KART = NumberNode:create(runtime, 571),
        MOWER = NumberNode:create(runtime, 572),
        DUNE = NumberNode:create(runtime, 573),
        SWEEPER = NumberNode:create(runtime, 574),
        BROADWAY = NumberNode:create(runtime, 575),
        TORNADO = NumberNode:create(runtime, 576),
        AT_400 = NumberNode:create(runtime, 577),
        DFT_30 = NumberNode:create(runtime, 578),
        HUNTLEY = NumberNode:create(runtime, 579),
        STAFFORD = NumberNode:create(runtime, 580),
        BF_400 = NumberNode:create(runtime, 581),
        NEWSVAN = NumberNode:create(runtime, 582),
        TUG = NumberNode:create(runtime, 583),
        TRAILER_TANKER_COMMANDO = NumberNode:create(runtime, 584),
        EMPEROR = NumberNode:create(runtime, 585),
        WAYFARER = NumberNode:create(runtime, 586),
        EUROS = NumberNode:create(runtime, 587),
        HOTDOG = NumberNode:create(runtime, 588),
        CLUB = NumberNode:create(runtime, 589),
        BOX_FREIGHT = NumberNode:create(runtime, 590),
        TRAILER_3 = NumberNode:create(runtime, 591),
        ANDROMADA = NumberNode:create(runtime, 592),
        DODO = NumberNode:create(runtime, 593),
        RC_CAM = NumberNode:create(runtime, 594),
        LAUNCH = NumberNode:create(runtime, 595),
        POLICE_LS = NumberNode:create(runtime, 596),
        POLICE_SF = NumberNode:create(runtime, 597),
        POLICE_LV = NumberNode:create(runtime, 598),
        POLICE_RANGER = NumberNode:create(runtime, 599),
        PICADOR = NumberNode:create(runtime, 600),
        SWAT = NumberNode:create(runtime, 601),
        ALPHA = NumberNode:create(runtime, 602),
        PHOENIX = NumberNode:create(runtime, 603),
        GLENDALE_DAMAGED = NumberNode:create(runtime, 604),
        SADLER_DAMAGED = NumberNode:create(runtime, 605),
        BAGGAGE_TRAILER_COVERED = NumberNode:create(runtime, 606),
        BAGGAGE_TRAILER_UNCOVERED = NumberNode:create(runtime, 607),
        TRAILER_STAIRS = NumberNode:create(runtime, 608),
        BOXVILLE_MISSION = NumberNode:create(runtime, 609),
        FARM_TRAILER = NumberNode:create(runtime, 610),
        STREET_CLEAN_TRAILER = NumberNode:create(runtime, 611),
    }
end

Core.mergeInto(VehicleClass, AbstractClass)