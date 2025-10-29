-----------------------------------
-- * Variables
-----------------------------------

StatClass = {}
StatClass.__index = StatClass

-----------------------------------
-- * Functions
-----------------------------------

function StatClass.set(_, stat, value)
    Game.setStat(stat, value)
end

function StatClass.get(runtime, stat)
    return NumberNode:create(runtime, Game.getStat(stat))
end

function StatClass.__preinit(runtime)
    StatClass.identifiers = {
        PROGRASS_MADE = NumberNode:create(runtime, 0),
        TOTAL_PROGRESS = NumberNode:create(runtime, 1),
        LONGEST_BASKETBALL = NumberNode:create(runtime, 2),

        DIST_FOOT = NumberNode:create(runtime, 3),
        DIST_CAR = NumberNode:create(runtime, 4),
        DIST_BIKE = NumberNode:create(runtime, 5),
        DIST_BOAT = NumberNode:create(runtime, 6),
        DIST_GOLF_CART = NumberNode:create(runtime, 7),
        DIST_HELICOPTER = NumberNode:create(runtime, 8),
        DIST_PLANE = NumberNode:create(runtime, 9),

        LONGEST_WHEELIE_DIST = NumberNode:create(runtime, 10),
        LONGEST_STOPPIE_DIST = NumberNode:create(runtime, 11),
        LONGEST_2WHEEL_DIST = NumberNode:create(runtime, 12),

        WEAPON_BUDGET = NumberNode:create(runtime, 13),
        FASHION_BUDGET = NumberNode:create(runtime, 14),
        PROPERTY_BUDGET = NumberNode:create(runtime, 15),
        SPRAYING_BUDGET = NumberNode:create(runtime, 16),

        LONGEST_WHEELIE_TIME = NumberNode:create(runtime, 17),
        LONGEST_STOPPIE_TIME = NumberNode:create(runtime, 18),
        LONGEST_2WHEEL_TIME = NumberNode:create(runtime, 19),

        FOOD_BUDGET = NumberNode:create(runtime, 20),

        FAT = NumberNode:create(runtime, 21),
        STAMINA = NumberNode:create(runtime, 22),
        BODY_MUSCLE = NumberNode:create(runtime, 23),
        MAX_HEALTH = NumberNode:create(runtime, 24),
        SEX_APPEAL = NumberNode:create(runtime, 25),

        DIST_SWIMMING = NumberNode:create(runtime, 26),
        DIST_CYCLE = NumberNode:create(runtime, 27),
        DIST_TREADMILL = NumberNode:create(runtime, 28),
        DIST_EXCERSISE_BIKE = NumberNode:create(runtime, 29),

        TATTOO_BUDGET = NumberNode:create(runtime, 30),
        HAIRDRESSING_BUDGET = NumberNode:create(runtime, 31),

        PROSTITUTE_BUDGET = NumberNode:create(runtime, 33),

        MONEY_SPENT_GAMBLING = NumberNode:create(runtime, 35),
        MONEY_MADE_PIMPING = NumberNode:create(runtime, 36),
        MONEY_WON_GAMBLING = NumberNode:create(runtime, 37),
        BIGGEST_GAMBLING_WIN = NumberNode:create(runtime, 38),
        BIGGEST_GAMBLING_LOSS = NumberNode:create(runtime, 39),

        LARGEST_BURGLARY_SWAG = NumberNode:create(runtime, 40),
        MONEY_MADE_BURGLARY = NumberNode:create(runtime, 41),

        LONGEST_TREADMILL_TIME = NumberNode:create(runtime, 44),
        LONGEST_EXCERSISE_BIKE_TIME = NumberNode:create(runtime, 45),

        HEAVIEST_WEIGHT_BENCH_PRESS = NumberNode:create(runtime, 46),
        HEAVIEST_WEIGHT_DUMBELLS = NumberNode:create(runtime, 47),

        BEST_TIME_HOTRING = NumberNode:create(runtime, 48),
        BEST_TIME_BMX = NumberNode:create(runtime, 49),

        LONGEST_CHASE_TIME = NumberNode:create(runtime, 51),
        LAST_CHASE_TIME = NumberNode:create(runtime, 52),

        WAGE_BILL = NumberNode:create(runtime, 53),

        STRIP_CLUB_BUDGET = NumberNode:create(runtime, 54),
        CAR_MOD_BUDGET = NumberNode:create(runtime, 55),

        TIME_SPENT_SHOPPING = NumberNode:create(runtime, 56),
        TOTAL_SHOPPING_BUDGET = NumberNode:create(runtime, 62),

        TIME_SPENT_UNDERWATER = NumberNode:create(runtime, 63),

        RESPECT_TOTAL = NumberNode:create(runtime, 64),
        RESPECT_GIRLFRIEND = NumberNode:create(runtime, 65),
        RESPECT_CLOTHES = NumberNode:create(runtime, 66),
        RESPECT_FITNESS = NumberNode:create(runtime, 67),
        RESPECT = NumberNode:create(runtime, 68),

        WEAPONTYPE_PISTOL_SKILL = NumberNode:create(runtime, 69),
        WEAPONTYPE_PISTOL_SILENCED_SKILL = NumberNode:create(runtime, 70),
        WEAPONTYPE_DESERT_EAGLE_SKILL = NumberNode:create(runtime, 71),
        WEAPONTYPE_SHOTGUN_SKILL = NumberNode:create(runtime, 72),
        WEAPONTYPE_SAWNOFF_SHOTGUN_SKILL = NumberNode:create(runtime, 73),
        WEAPONTYPE_SPAS12_SHOTGUN_SKILL = NumberNode:create(runtime, 74),
        WEAPONTYPE_MICRO_UZI_SKILL = NumberNode:create(runtime, 75),
        WEAPONTYPE_MP5_SKILL = NumberNode:create(runtime, 76),
        WEAPONTYPE_AK47_SKILL = NumberNode:create(runtime, 77),
        WEAPONTYPE_M4_SKILL = NumberNode:create(runtime, 78),
        WEAPONTYPE_SNIPERRIFLE_SKILL = NumberNode:create(runtime, 79),

        SEX_APPEAL_CLOTHES = NumberNode:create(runtime, 80),

        GAMBLING = NumberNode:create(runtime, 81),

        PEOPLE_KILLED_BY_OTHERS = NumberNode:create(runtime, 120),
        PEOPLE_KILLED_BY_PLAYER = NumberNode:create(runtime, 121),

        CARS_DESTROYED = NumberNode:create(runtime, 122),
        BOATS_DESTROYED = NumberNode:create(runtime, 123),
        HELICOPTORS_DESTROYED = NumberNode:create(runtime, 124),
        PROPERTY_DESTROYED = NumberNode:create(runtime, 125),

        ROUNDS_FIRED = NumberNode:create(runtime, 126),
        EXPLOSIVES_USED = NumberNode:create(runtime, 127),

        BULLETS_HIT = NumberNode:create(runtime, 128),
        TYRES_POPPED = NumberNode:create(runtime, 129),
        HEADS_POPPED = NumberNode:create(runtime, 130),

        WANTED_STARS_ATTAINED = NumberNode:create(runtime, 131),
        WANTED_STARS_EVADED = NumberNode:create(runtime, 132),
        TIMES_ARRESTED = NumberNode:create(runtime, 133),

        DAYS_PASSED = NumberNode:create(runtime, 134),
        TIMES_DIED = NumberNode:create(runtime, 135),
        TIMES_SAVED = NumberNode:create(runtime, 136),
        TIMES_CHEATED = NumberNode:create(runtime, 137),

        SPRAYINGS = NumberNode:create(runtime, 138),

        MAX_JUMP_DISTANCE = NumberNode:create(runtime, 139),
        MAX_JUMP_HEIGHT = NumberNode:create(runtime, 140),
        MAX_JUMP_FLIPS = NumberNode:create(runtime, 141),
        MAX_JUMP_SPINS = NumberNode:create(runtime, 142),

        BEST_STUNT = NumberNode:create(runtime, 143),

        UNIQUE_JUMPS_FOUND = NumberNode:create(runtime, 144),
        UNIQUE_JUMPS_DONE = NumberNode:create(runtime, 145),

        MISSIONS_ATTEMPTED = NumberNode:create(runtime, 146),
        MISSIONS_PASSED = NumberNode:create(runtime, 147),
        TOTAL_MISSIONS = NumberNode:create(runtime, 148),

        TAXI_MONEY_MADE = NumberNode:create(runtime, 149),
        PASSENGERS_DELIVERED_IN_TAXI = NumberNode:create(runtime, 150),
        LIVES_SAVED = NumberNode:create(runtime, 151),
        CRIMINALS_CAUGHT = NumberNode:create(runtime, 152),
        FIRES_EXTINGUISHED = NumberNode:create(runtime, 153),
        PIZZAS_DELIVERED = NumberNode:create(runtime, 154),
        ASSASSINATIONS = NumberNode:create(runtime, 155),
        LATEST_DANCE_SCORE = NumberNode:create(runtime, 156),

        VIGILANTE_LEVEL = NumberNode:create(runtime, 157),
        AMBULANCE_LEVEL = NumberNode:create(runtime, 158),
        FIREFIGHTER_LEVEL = NumberNode:create(runtime, 159),

        DRIVING_SKILL = NumberNode:create(runtime, 160),
        TRUCK_MISSIONS_PASSED = NumberNode:create(runtime, 161),
        TRUCK_MONEY_MADE = NumberNode:create(runtime, 162),

        RECRUITED_GANG_MEMBERS_KILLED = NumberNode:create(runtime, 163),
        ARMOUR = NumberNode:create(runtime, 164),
        ENERGY = NumberNode:create(runtime, 165),

        PHOTOS_TAKEN = NumberNode:create(runtime, 166),

        KILL_FRENZIES_ATTEMPTED = NumberNode:create(runtime, 167),
        KILL_FRENZIES_PASSED = NumberNode:create(runtime, 168),

        FLIGHT_TIME = NumberNode:create(runtime, 169),
        TIMES_DROWNED = NumberNode:create(runtime, 170),
        NUM_GIRLS_PIMPED = NumberNode:create(runtime, 171),

        BEST_POSITION_HOTRING = NumberNode:create(runtime, 172),
        FLIGHT_TIME_JETPACK = NumberNode:create(runtime, 173),

        SHOOTING_RANGE_SCORE = NumberNode:create(runtime, 174),
        VALET_CARS_PARKED = NumberNode:create(runtime, 175),

        KILLS_SINCE_LAST_CHECKPOINT = NumberNode:create(runtime, 176),
        TOTAL_LEGITIMATE_KILLS = NumberNode:create(runtime, 177),

        BLOODRING_KILLS = NumberNode:create(runtime, 178),
        BLOODRING_TIME = NumberNode:create(runtime, 179),

        NO_MORE_HURRICANES = NumberNode:create(runtime, 180),
        CITIES_PASSED = NumberNode:create(runtime, 181),

        POLICE_BRIBES = NumberNode:create(runtime, 182),
        CARS_STOLEN = NumberNode:create(runtime, 183),
        CURRENT_GIRLFRIENDS = NumberNode:create(runtime, 184),
        BAD_DATES = NumberNode:create(runtime, 185),
        GIRL_DATED = NumberNode:create(runtime, 186),
        TIMES_SCORED_WITH_GIRL = NumberNode:create(runtime, 187),
        DATES = NumberNode:create(runtime, 188),
        GIRLS_DATED = NumberNode:create(runtime, 189),
        TIMES_VISITED_PROSTITUTE = NumberNode:create(runtime, 190),
        HOUSES_BURGLED = NumberNode:create(runtime, 191),
        SAFES_CRACKED = NumberNode:create(runtime, 192),

        STOLEN_ITEMS_SOLD = NumberNode:create(runtime, 194),
        EIGHT_BALLS_IN_POOL = NumberNode:create(runtime, 195),
        WINS_IN_POOL = NumberNode:create(runtime, 196),
        LOSSES_IN_POOL = NumberNode:create(runtime, 197),
        VISITS_TO_GYM = NumberNode:create(runtime, 198),

        MEALS_EATEN = NumberNode:create(runtime, 200),

        UNDERWATER_STAMINA = NumberNode:create(runtime, 225),
        BIKE_SKILL = NumberNode:create(runtime, 229),
        CYCLE_SKILL = NumberNode:create(runtime, 230),
    }
end

Core.mergeInto(StatClass, AbstractClass)