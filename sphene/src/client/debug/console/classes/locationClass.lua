-----------------------------------
-- * Variables
-----------------------------------

LocationClass = {}
LocationClass.__index = LocationClass

-----------------------------------
-- * Functions
-----------------------------------

function LocationClass.__preinit(runtime)
    LocationClass.identifiers = {
        -- AIRPORTS
        LV_AIRPORT = Vector3Class.create(runtime, 1433, 1432, 11),
        SF_AIRPORT = Vector3Class.create(runtime, -1329, -8, 15),
        LS_AIRPORT = Vector3Class.create(runtime, 1909, -2411, 14),

        -- TRAIN STATIONS
        MARKET_STATION = Vector3Class.create(runtime, 823, -1362, 0),
        UNITY_STATION = Vector3Class.create(runtime, 1718, -1945, 14),
        CRANBERRY_STATION = Vector3Class.create(runtime, -1957, 129, 28),
        YELLOW_BELL_STATION = Vector3Class.create(runtime, 1434, 2629, 12),
        LINDEN_STATION = Vector3Class.create(runtime, 2859, 1291, 12),
        SOBELL_RAIL_YARDS = Vector3Class.create(runtime, 2779, 1779, 12),

        -- INTERIORS
        AMMU_NATION_1 = Vector3Class.create(runtime, 289.7870, -35.7190, 1003.5160),
        BURGLARY_HOUSE_1 = Vector3Class.create(runtime, 224.6351, 1289.012, 1082.141),
        THE_WELLCOME_PUMP = Vector3Class.create(runtime, 681.65, -452.86, -25.62),
        RESTAURANT_1 = Vector3Class.create(runtime, 446.6941, -9.7977, 1000.7340),
        CALIGULAS_CASINO = Vector3Class.create(runtime, 2235.2524, 1708.5146, 1010.6129),
        DENISES_PLACE = Vector3Class.create(runtime, 244.0892, 304.8456, 999.1484),
        SHAMAL_CABIN = Vector3Class.create(runtime, 1.6127, 34.7411, 1199.0),
        LIBERTY_CITY = Vector3Class.create(runtime, -750.80, 491.00, 1371.70),
        SWEETS_HOUSE = Vector3Class.create(runtime, 2525.0420, -1679.1150, 1015.4990),
        TRANSFENDER = Vector3Class.create(runtime, 621.7850, -12.5417, 1000.9220),
        SAFE_HOUSE_4 = Vector3Class.create(runtime, 2216.5400, -1076.2900, 1050.4840),
        TRIALS_STADIUM = Vector3Class.create(runtime, -1401.13, 106.110, 1032.273),
        WAREHOUSE_1 = Vector3Class.create(runtime, 1405.3120, -8.2928, 1000.9130),
        DOHERTY_GARAGE = Vector3Class.create(runtime, -2042.42, 178.59, 28.84),
        SINDACCO_ABATOIR = Vector3Class.create(runtime, 963.6078, 2108.3970, 1011.0300),
        SUB_URBAN = Vector3Class.create(runtime, 203.8173, -46.5385, 1001.8050),
        WU_ZI_MUS_BETTING_PLACE = Vector3Class.create(runtime, -2159.9260, 641.4587, 1052.3820),

        RYDERS_HOUSE = Vector3Class.create(runtime, 2464.2110, -1697.9520, 1013.5080),
        ANGEL_PINE_TRAILER = Vector3Class.create(runtime, 0.3440, -0.5140, 1000.5490),
        THE_PIG_PEN = Vector3Class.create(runtime, 1213.4330, -6.6830, 1000.9220),
        BDUPS_CRACK_PALACE = Vector3Class.create(runtime, 1523.7510, -46.0458, 1002.1310),
        BIG_SMOKES_CRACK_PALACE = Vector3Class.create(runtime, 2543.6610, -1303.9320, 1025.0700),
        BURGLARY_HOUSE_2 = Vector3Class.create(runtime, 225.756, 1240.000, 1082.149),
        BURGLARY_HOUSE_3 = Vector3Class.create(runtime, 447.470, 1398.348, 1084.305),
        BURGLARY_HOUSE_4 = Vector3Class.create(runtime, 491.740, 1400.541, 1080.265),
        KATIES_PLACE = Vector3Class.create(runtime, 267.2290, 304.7100, 999.1480),
        LOCO_LOW_CO = Vector3Class.create(runtime, 612.5910, -75.6370, 997.9920),
        REECES_BARBERSHOP = Vector3Class.create(runtime, 411.6259, -21.4332, 1001.8046),

        JIZZYS_PLEASURE_DOMES = Vector3Class.create(runtime, -2636.7190, 1402.9170, 906.4609),
        BROTHEL = Vector3Class.create(runtime, 940.6520, -18.4860, 1000.9300),
        BROTHEL_2 = Vector3Class.create(runtime, 967.5334, -53.0245, 1001.1250),
        BDUPS_APARTMENT = Vector3Class.create(runtime, 1527.38, -11.02, 1002.10),
        BIKE_SCHOOL = Vector3Class.create(runtime, 1494.3350, 1305.6510, 1093.2890),
        BIG_SPREAD_RANCH = Vector3Class.create(runtime, 1210.2570, -29.2986, 1000.8790),
        LV_TATTOO_PARLOUR = Vector3Class.create(runtime, -204.4390, -43.6520, 1002.2990),
        LVPD_HQ = Vector3Class.create(runtime, 289.7703, 171.7460, 1007.1790),
        OG_LOCS_HOUSE = Vector3Class.create(runtime, 516.8890, -18.4120, 1001.5650),
        PRO_LAPS = Vector3Class.create(runtime, 207.3560, -138.0029, 1003.3130),
        LAS_VENTURAS_PLANNING_DEP = Vector3Class.create(runtime, 374.6708, 173.8050, 1008.3893),
        RECORD_LABEL_HALLWAY = Vector3Class.create(runtime, 1038.2190, 6.9905, 1001.2840),
        DRIVING_SCHOOL = Vector3Class.create(runtime, -2027.9200, -105.1830, 1035.1720),
        JOHNSON_HOUSE = Vector3Class.create(runtime, 2496.0500, -1693.9260, 1014.7420),
        BURGLARY_HOUSE_5 = Vector3Class.create(runtime, 234.733, 1190.391, 1080.258),
        GAY_GORDOS_BARBERSHOP = Vector3Class.create(runtime, 418.6530, -82.6390, 1001.8050),
        HELENAS_PLACE = Vector3Class.create(runtime, 292.4459, 308.7790, 999.1484),
        INSIDE_TRACK_BETTING = Vector3Class.create(runtime, 826.8863, 5.5091, 1004.4830),
        SEX_SHOP = Vector3Class.create(runtime, -106.7268, -19.6444, 1000.7190),
        WHEEL_ARCH_ANGELS = Vector3Class.create(runtime, 614.3889, -124.0991, 997.9950),

        SHOP_1 = Vector3Class.create(runtime, -27.3769, -27.6416, 1003.5570),
        AMMU_NATION_2 = Vector3Class.create(runtime, 285.8000, -84.5470, 1001.5390),
        BURGLARY_HOUSE_6 = Vector3Class.create(runtime, -262.91, 1454.966, 1084.367),
        BURGLARY_HOUSE_7 = Vector3Class.create(runtime, 221.4296, 1142.423, 1082.609),
        BURGLARY_HOUSE_8 = Vector3Class.create(runtime, 261.1168, 1286.519, 1080.258),
        DINER_2 = Vector3Class.create(runtime, 460.0, -88.43, 999.62),
        DIRTBIKE_STADIUM = Vector3Class.create(runtime, -1435.8690, -662.2505, 1052.4650),
        MICHELLES_PLACE = Vector3Class.create(runtime, 302.6404, 304.8048, 999.1484),

        MADD_DOGGS_MANSION = Vector3Class.create(runtime, 1262.1451416016, -785.32977294922, 1091.90625),
        WELL_STACKED_PIZZA_CO = Vector3Class.create(runtime, 377.7758, -126.2766, 1001.4920),
        VICTIM = Vector3Class.create(runtime, 221.3310, -6.6169, 1005.1977),
        BURNING_DESIRE_HOUSE = Vector3Class.create(runtime, 2351.1540, -1180.5770, 1027.9770),
        BARBARAS_PLACE = Vector3Class.create(runtime, 322.1979, 302.4979, 999.1484),
        BURGLARY_HOUSE_9 = Vector3Class.create(runtime, 22.79996, 1404.642, 1084.43),
        BURGLARY_HOUSE_10 = Vector3Class.create(runtime, 228.9003, 1114.477, 1080.992),
        BURGLARY_HOUSE_11 = Vector3Class.create(runtime, 140.5631, 1369.051, 1083.864),
        THE_CRACK_DEN = Vector3Class.create(runtime, 322.1117, 1119.3270, 1083.8830),
        POLICE_STATION = Vector3Class.create(runtime, 322.72, 306.43, 999.15),
        DINER_1 = Vector3Class.create(runtime, 448.7435, -110.0457, 1000.0772),
        GANTON_GYM = Vector3Class.create(runtime, 768.0793, 5.8606, 1000.7160),
        VANK_HOFF_HOTEL = Vector3Class.create(runtime, 2232.8210, -1110.0180, 1050.8830),

        AMMU_NATION_3 = Vector3Class.create(runtime, 297.4460, -109.9680, 1001.5160),
        AMMU_NATION_4 = Vector3Class.create(runtime, 317.2380, -168.0520, 999.5930),
        LSPD_HQ = Vector3Class.create(runtime, 246.4510, 65.5860, 1003.6410),
        SAFE_HOUSE_3 = Vector3Class.create(runtime, 2333.0330, -1073.9600, 1049.0230),
        SAFE_HOUSE_5 = Vector3Class.create(runtime, 2194.2910, -1204.0150, 1049.0230),
        SAFE_HOUSE_6 = Vector3Class.create(runtime, 2308.8710, -1210.7170, 1049.0230),
        COBRA_MARITAL_ARTS_GYM = Vector3Class.create(runtime, 774.0870, -47.9830, 1000.5860),
        SHOP_2 = Vector3Class.create(runtime, -26.7180, -55.9860, 1003.5470),
        MILLIES_BEDROOM = Vector3Class.create(runtime, 344.5200, 304.8210, 999.1480),
        FANNY_BATTERS_BROTHEL = Vector3Class.create(runtime, 744.2710, 1437.2530, 1102.7030),
        RESTAURANT_2 = Vector3Class.create(runtime, 443.9810, -65.2190, 1050.0000),
        BURGLARY_HOUSE_15 = Vector3Class.create(runtime, 234.319, 1066.455, 1084.208),
        BURGLARY_HOUSE_16 = Vector3Class.create(runtime, -69.049, 1354.056, 1080.211),

        AMMU_NATION_5 = Vector3Class.create(runtime, 315.3850, -142.2420, 999.6010),
        TRACK_STADIUM = Vector3Class.create(runtime, -1417.8720, -276.4260, 1051.1910),
        BELOW_THE_BELT_GYM = Vector3Class.create(runtime, 774.2430, -76.0090, 1000.6540),

        SAFE_HOUSE_2 = Vector3Class.create(runtime, 2365.2383, -1134.2969, 1050.875),
        COLONEL_FUHRBERGERS_HOUSE = Vector3Class.create(runtime, 2807.8990, -1172.9210, 1025.5700),
        BURGLARY_HOUSE_22 = Vector3Class.create(runtime, -42.490, 1407.644, 1084.43),

        UNKNOWN_SAFE_HOUSE = Vector3Class.create(runtime, 2253.1740, -1139.0100, 1050.6330),
        ANDROMADA_CARGO_HOLD = Vector3Class.create(runtime, 315.48, 984.13, 1959.11),
        BURGLARY_HOUSE_12 = Vector3Class.create(runtime, 85.32596, 1323.585, 1083.859),
        BURGLARY_HOUSE_13 = Vector3Class.create(runtime, 260.3189, 1239.663, 1084.258),
        CLUCKIN_BELL = Vector3Class.create(runtime, 365.67, -11.61, 1002),

        FOUR_DRAGONS_CASINO = Vector3Class.create(runtime, 2009.4140, 1017.8990, 994.4680),
        RC_ZEROS_BATTLEFIELD = Vector3Class.create(runtime, -975.5766, 1061.1312, 1345.6719),
        BURGER_SHOT = Vector3Class.create(runtime, 366.4220, -73.4700, 1001.5080),
        BURGLARY_HOUSE_14 = Vector3Class.create(runtime, 21.241, 1342.153, 1084.375),
        JANIOTOR_ROOM = Vector3Class.create(runtime, 1891.3960, 1018.1260, 31.8820),
        SAFE_HOUSE_1 = Vector3Class.create(runtime, 2262.83, -1137.71, 1050.63),
        HASHBURY_SAFE_HOUSE = Vector3Class.create(runtime, 2264.5231, -1210.5229, 1049.0234),
        SHOP_3 = Vector3Class.create(runtime, 6.0780, -28.6330, 1003.5490),
        ABANDONED_AC_TOWER = Vector3Class.create(runtime, 419.6140, 2536.6030, 10.0000),
        SFPD_HQ = Vector3Class.create(runtime, 246.4410, 112.1640, 1003.2190),

        FOUR_DRAGONS_OFFICE = Vector3Class.create(runtime, 2011.6030, 1017.0230, 39.0910),
        LOS_SANTOS_SAFE_HOUSE = Vector3Class.create(runtime, 2282.9766, -1140.2861, 1050.8984),
        TEN_GREEN_BOTTLES_BAR = Vector3Class.create(runtime, 502.3310, -70.6820, 998.7570),

        BUDGET_INN_MOTEL_ROOM = Vector3Class.create(runtime, 444.6469, 508.2390, 1001.4194),
        THE_CASINO = Vector3Class.create(runtime, 1132.9450, -8.6750, 1000.6800),
        MACISLAS_BARBERSHOP = Vector3Class.create(runtime, 411.6410, -51.8460, 1001.8980),
        SAFE_HOUSE_7 = Vector3Class.create(runtime, 2324.3848, -1148.4805, 1050.7101),
        MODERN_SAFE_HOUSE = Vector3Class.create(runtime, 2324.4990, -1147.0710, 1050.7100),

        LS_ATRIUM = Vector3Class.create(runtime, 1724.33, -1625.784, 20.211),
        CJS_GARAGE = Vector3Class.create(runtime, -2043.966, 172.932, 28.835),

        KICKSTART_STADIUM = Vector3Class.create(runtime, -1464.5360, 1557.6900, 1052.5310),
        DIDIER_SACHS = Vector3Class.create(runtime, 204.1789, -165.8740, 1000.5230),
        FRANCIS_INT_AIRPORT = Vector3Class.create(runtime, -1827.1473, 7.2074, 1061.1435),
        FRANCIS_INT_AIRPORT_2 = Vector3Class.create(runtime, -1855.5687, 41.2631, 1061.1435),
        WARDROBE = Vector3Class.create(runtime, 255.7190, -41.1370, 1002.0230),

        BINCO = Vector3Class.create(runtime, 207.5430, -109.0040, 1005.1330),
        BLOOD_BOWL_STADIUM = Vector3Class.create(runtime, -1394.20, 987.62, 1023.96),
        JEFFERSON_MOTEL = Vector3Class.create(runtime, 2217.6250, -1150.6580, 1025.7970),
        BURGLARY_HOUSE_17 = Vector3Class.create(runtime, -285.711, 1470.697, 1084.375),
        BURGLARY_HOUSE_18 = Vector3Class.create(runtime, 327.808, 1479.74, 1084.438),
        BURGLARY_HOUSE_19 = Vector3Class.create(runtime, 375.572, 1417.439, 1081.328),
        BURGLARY_HOUSE_20 = Vector3Class.create(runtime, 384.644, 1471.479, 1080.195),
        BURGLARY_HOUSE_21 = Vector3Class.create(runtime, 295.467, 1474.697, 1080.258),

        SHOP_4 = Vector3Class.create(runtime, -25.3730, -139.6540, 1003.5470),
        LS_TATTOO_PARLOUR = Vector3Class.create(runtime, -204.5580, -25.6970, 1002.2730),
        SUMORING_STADIUM = Vector3Class.create(runtime, -1400, 1250, 1040),

        SHOP_5 = Vector3Class.create(runtime, -25.3930, -185.9110, 1003.5470),
        CLUB = Vector3Class.create(runtime, 493.4687, -23.0080, 1000.6796),
        RUSTY_BROWNS = Vector3Class.create(runtime, 377.0030, -192.5070, 1000.6330),
        SHERMANS_DAM = Vector3Class.create(runtime, -942.1320, 1849.1420, 5.0050),
        HEMLOCK_TATTOO = Vector3Class.create(runtime, 377.0030, -192.5070, 1000.6330),

        LIL_PROBE_INN = Vector3Class.create(runtime, -227.0280, 1401.2290, 27.7690),
        SHOP_6 = Vector3Class.create(runtime, -30.9460, -89.6090, 1003.5490),
        ATRIUM = Vector3Class.create(runtime, 1726.1370, -1645.2300, 20.2260),
        WAREHOUSE_2 = Vector3Class.create(runtime, 1296.6310, 0.5920, 1001.0230),
        ZIP = Vector3Class.create(runtime, 161.4620, -91.3940, 1001.8050),

        LS_STADIUM = Vector3Class.create(runtime, 2681.9816894531, -1688.0222167969, 9.4189739227295),
        SF_STADIUM = Vector3Class.create(runtime, -2133.1875, -444.31619262695, 35.3359375),
        LV_STADIUM = Vector3Class.create(runtime, 1099.8592529297, 1617.2945556641, 12.546875),
    }
end

Core.mergeInto(LocationClass, AbstractClass)