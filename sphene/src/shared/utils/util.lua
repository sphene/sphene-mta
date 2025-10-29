-----------------------------------
-- * Variables
-----------------------------------

local screenW

if (guiGetScreenSize ~= nil) then
    screenW, _ = guiGetScreenSize()
end

boneNameToId = {
    ["Root"] = 0,
    ["Pelvis"] = 1,
    ["Spine"] = 2,
    ["Spine1"] = 3,
    ["Neck"] = 4,
    ["Head"] = 5,
    ["L Brow"] = 6,
    ["R Brow"] = 7,
    ["Jaw"] = 8,
    ["Bip01 R Clavicle"] = 21,
    ["R UpperArm"] = 22,
    ["R Forearm"] = 23,
    ["R Hand"] = 24,
    ["R Fingers"] = 25,
    ["R Finger01"] = 26,
    ["Bip01 L Clavicle"] = 31,
    ["L UpperArm"] = 32,
    ["L Forearm"] = 33,
    ["L Hand"] = 34,
    ["L Fingers"] = 35,
    ["L Finger01"] = 36,
    ["L Thigh"] = 41,
    ["L Calf"] = 42,
    ["L Foot"] = 43,
    ["L Toe"] = 44,
    ["R Thigh"] = 51,
    ["R Calf"] = 52,
    ["R Foot"] = 53,
    ["R Toe"] = 54
}

threadToMission = {
    ['INTRO'] = 'Intro',
    ['NONE'] = 'Video Game: They Crawled From Uranus',
    ['DUAL'] = 'Video Game: Dualuty',
    ['SHTR'] = 'Video Game: Go Go Space Monkey',
    ['GRAV'] = 'Video Game: Let\'s Get Ready To Bumble',
    ['OTB'] = 'Video Game: Inside Track Betting',
    ['POOL2'] = 'Pool',
    ['LOWR'] = 'Lowrider (Bet And Dance)',
    ['ZERO5'] = 'Beefy Baron',
    ['INTRO1'] = 'Big Smoke',
    ['INTRO2'] = 'Ryder',
    ['SWEET1'] = 'Tagging Up Turf',
    ['SWEET1B'] = 'Cleaning The Hood',
    ['SWEET3'] = 'Drive-Thru',
    ['SWEET2'] = 'Nines And AK\'s',
    ['SWEET4'] = 'Drive-By',
    ['HOODS5'] = 'Sweet\'s Girl',
    ['SWEET6'] = 'Cesar Vialpando',
    ['SWEET7'] = 'Los Sepulcros',
    ['CRASH4'] = 'Doberman',
    ['CRASH1'] = 'Burning Desire',
    ['DRUGS3'] = 'Gray Imports',
    ['GUNS1'] = 'Home Invasion',
    ['RYDER3'] = 'Catalyst',
    ['RYDER2'] = 'Robbing Uncle Sam',
    ['TWAR7'] = 'OG Loc',
    ['SMOKE2'] = 'Running Dog',
    ['SMOKE3'] = 'Wrong Side of the Tracks',
    ['DRUGS1'] = 'Just Business',
    ['MUSIC1'] = 'Life\'s a Beach',
    ['MUSIC2'] = 'Madd Dogg\'s Rhymes',
    ['MUSIC3'] = 'Management Issues',
    ['MUSIC5'] = 'House Party',
    ['CPRACE'] = 'Race Tournament / 8-track / Dirt Track',
    ['CESAR1'] = 'Lowrider (High Stakes)',
    ['DRUGS4'] = 'Reuniting The Families',
    ['LA1FIN2'] = 'The Green Sabre',
    ['BCRASH1'] = 'Badlands',
    ['CATALIN'] = 'First Date',
    ['CAT1'] = 'Local Liquor Store',
    ['CAT2'] = 'Small Town Bank',
    ['CAT3'] = 'Tanker Commander',
    ['CAT4'] = 'Against All Odds',
    ['CATCUT'] = 'King in Exile',
    ['TRUTH1'] = 'Body Harvest',
    ['TRUTH2'] = 'Are you going to San Fierro?',
    ['BCESAR4'] = 'Wu Zi Mu / Farewell, My Love...',
    ['GARAG1'] = 'Wear Flowers In Your Hair',
    ['DECON'] = 'Deconstruction',
    ['SCRASH3'] = '555 WE TIP',
    ['SCRASH2'] = 'Snail Trail',
    ['WUZI1'] = 'Mountain Cloud Boys',
    ['FARLIE4'] = 'Ran Fa Li',
    ['DRIV6'] = 'Lure',
    ['WUZI2'] = 'Amphibious Assault',
    ['WUZI5'] = 'The Da Nang Thang',
    ['SYN1'] = 'Photo Opportunity',
    ['SYN2'] = 'Jizzy',
    ['SYN3'] = 'Outrider',
    ['SYND4'] = 'Ice Cold Killa',
    ['SYN6'] = 'Toreno\'s Last Flight',
    ['SYN7'] = 'Yay Ka-Boom-Boom',
    ['SYN5'] = 'Pier 69',
    ['DRIV2'] = 'T-Bone Mendez',
    ['DRIV3'] = 'Mike Toreno',
    ['STEAL1'] = 'Zeroing In',
    ['STEAL2'] = 'Test Drive',
    ['STEAL4'] = 'Customs Fast Track',
    ['STEAL5'] = 'Puncture Wounds',
    ['DSKOOL'] = 'Back to School',
    ['ZERO1'] = 'Air Raid',
    ['ZERO2'] = 'Supply Lines...',
    ['ZERO4'] = 'New Model Army',
    ['TORENO1'] = 'Monster',
    ['TORENO2'] = 'Highjack',
    ['DES3'] = 'Interdiction',
    ['DESERT4'] = 'Verdant Meadows',
    ['DESERT6'] = 'N.O.E.',
    ['DESERT9'] = 'Stowaway',
    ['MAF4'] = 'Black Project',
    ['DES10'] = 'Green Goo',
    ['DESERT5'] = 'Learning to Fly',
    ['CASINO1'] = 'Fender Ketchup',
    ['CASINO2'] = 'Explosive Situation',
    ['CASINO3'] = 'You\'ve Had Your Chips',
    ['CASINO7'] = 'Fish in a Barrel',
    ['CASINO4'] = 'Don Peyote',
    ['CASINO5'] = 'Intensive Care',
    ['CASINO6'] = 'The Meat Business',
    ['CASINO9'] = 'Freefall',
    ['CASIN10'] = 'Saint Mark\'s Bistro',
    ['VCRASH1'] = 'Misappropriation',
    ['VCR2'] = 'High Noon',
    ['DOC2'] = 'Madd Dogg',
    ['HEIST1'] = 'Architectural Espionage',
    ['HEIST3'] = 'Key To Her Heart',
    ['HEIST2'] = 'Dam And Blast',
    ['HEIST4'] = 'Cop Wheels',
    ['HEIST5'] = 'Up, Up and Away!',
    ['HEIST9'] = 'Breaking the Bank at Caligula\'s',
    ['MANSIO1'] = 'A Home In The Hills',
    ['MANSIO2'] = 'Vertical Bird',
    ['MANSIO3'] = 'Home Coming',
    ['MANSON5'] = 'Cut Throat Business',
    ['GROVE1'] = 'Beat Down on B Dup',
    ['GROVE2'] = 'Grove 4 Life',
    ['RIOT1'] = 'Riot',
    ['RIOT2'] = 'Los Desperados',
    ['FINALEA'] = 'End Of The Line (1)',
    ['FINALEB'] = 'End Of The Line (2)',
    ['FINALEC'] = 'End Of The Line (3)',
    ['SHRANGE'] = 'Shooting range',
    ['GYMLS'] = 'Los Santos Gym Fight School',
    ['GYMSF'] = 'San Fierro Gym Fight School',
    ['GYMLV'] = 'Las Venturas Gym Fight School',
    ['TRUCK'] = 'Trucking',
    ['QUARRY'] = 'Quarry',
    ['BOAT'] = 'Boat School',
    ['BSKOOL'] = 'Bike School',
    ['TAXIODD'] = 'Taxi-Driver Sub-Mission',
    ['AMBULAN'] = 'Paramedic Sub-Mission',
    ['FIRETRU'] = 'Firefighter Sub-Mission',
    ['COPCAR'] = 'Vigilante Sub-Mission',
    ['BURGJB'] = 'Burglary Sub-Mission',
    ['FREIGHT'] = 'Freight Train Sub-Mission',
    ['PIMP'] = 'Pimping Sub-Mission',
    ['BLOOD'] = 'Arena Mission: Blood Ring',
    ['KICKSTA'] = 'Arena Mission: Kickstart',
    ['TRIA'] = 'Beat the Cock!',
    ['BCOUR'] = 'Courier',
    ['MTBIKER'] = 'The Chiliad Challenge',
    ['STUNT'] = 'BMX / NRG-500 STUNT Mission',
    ['BUYPRO1'] = 'Buy Properties Mission',
}

-----------------------------------
-- * Function
-----------------------------------

-- Taken from the MTA wiki
function findRotation( x1, y1, x2, y2 )
    local t = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
    return t < 0 and t + 360 or t
end

function findRotation3D( x1, y1, z1, x2, y2, z2 )
	local rotx = math.atan2 ( z2 - z1, getDistanceBetweenPoints2D ( x2,y2, x1,y1 ) )
	rotx = math.deg(rotx)
	local rotz = -math.deg( math.atan2( x2 - x1, y2 - y1 ) )
	rotz = rotz < 0 and rotz + 360 or rotz
	return rotx, 0,rotz
end

function getPointFromDistanceRotation(x, y, dist, angle)

    local a = math.rad(90 - angle);

    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;

    return x+dx, y+dy;

end

function convertRes(size, orgWidth, disableScale)
    orgWidth = orgWidth or 1920

	local newSize = size*(screenW/orgWidth)

    if (disableScale == nil) then
        if(screenW == 1920) then
            return newSize
        elseif(screenW >= 1600) then
            return (newSize*0.8)
        elseif(screenW <= 1000) then
            return (newSize*1.4)
        else
            return (newSize*1)
        end
    end

    return newSize
end

function getModelIDFromName(modelName)
    if (modelName == nil) then
        return 0
    end

    for id, model in pairs(modelRefs) do
        if (model:lower() == modelName:lower()) then
            return id
        end
    end
    return 0
end

function toeuler(w, x, y, z)
    return
        math.deg(math.atan2(2*(y*w-x*z), 1-2*y^2-2*z^2)),
        math.deg(math.asin(2*(x*y+z*w))),
        math.deg(math.atan2(2*x*w-2*y*z,1-2*x^2-2*z^2))
end

function tablecopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[tablecopy(orig_key)] = tablecopy(orig_value)
        end
        setmetatable(copy, tablecopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

function randomFloat(min, max, precision)
	local range = max - min
	local offset = range * math.random()
	local unrounded = min + offset

	if not precision then
		return unrounded
	end

	local powerOfTen = 10 ^ precision
	return math.floor(unrounded * powerOfTen + 0.5) / powerOfTen
end

function getQuadBezier(point1, point2, point3, time)
    return (1 - time) ^ 2 * point1 + 2 * (1 - time) * time * point2 + time ^ 2 * point3
end

local identityMatrix = {
	[1] = {1, 0, 0},
	[2] = {0, 1, 0},
	[3] = {0, 0, 1}
}

function quaternionTo3x3(x,y,z,w)
	local matrix3x3 = {[1] = {}, [2] = {}, [3] = {}}

	local symetricalMatrix = {
		[1] = {(-(y*y)-(z*z)), x*y, x*z},
		[2] = {x*y, (-(x*x)-(z*z)), y*z},
		[3] = {x*z, y*z, (-(x*x)-(y*y))}
	}

	local antiSymetricalMatrix = {
		[1] = {0, -z, y},
		[2] = {z, 0, -x},
		[3] = {-y, x, 0}
	}

	for i = 1, 3 do
		for j = 1, 3 do
			matrix3x3[i][j] = identityMatrix[i][j]+(2*symetricalMatrix[i][j])+(2*w*antiSymetricalMatrix[i][j])
		end
	end

	return matrix3x3
end

function getEulerAnglesFromMatrix(x1,y1,z1,x2,y2,z2,x3,y3,z3)
	local nz1,nz2,nz3
	nz3 = math.sqrt(x2*x2+y2*y2)
	nz1 = -x2*z2/nz3
	nz2 = -y2*z2/nz3
	local vx = nz1*x1+nz2*y1+nz3*z1
	local vz = nz1*x3+nz2*y3+nz3*z3
	return math.deg(math.asin(z2)),-math.deg(math.atan2(vx,vz)),-math.deg(math.atan2(x2,y2))
end

function fromQuaternion(x,y,z,w)
	local matrix = quaternionTo3x3(x,y,z,w)
	local ox,oy,oz = getEulerAnglesFromMatrix(
		matrix[1][1], matrix[1][2], matrix[1][3],
		matrix[2][1], matrix[2][2], matrix[2][3],
		matrix[3][1], matrix[3][2], matrix[3][3]
	)

	return ox,oy,oz
end

function dxDrawBorderedText(outline, text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    outline = (scale or 1) * (1.333333333333334 * (outline or 1))
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left - outline, top - outline, right - outline, bottom - outline, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left + outline, top - outline, right + outline, bottom - outline, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left - outline, top + outline, right - outline, bottom + outline, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left + outline, top + outline, right + outline, bottom + outline, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left - outline, top, right - outline, bottom, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left + outline, top, right + outline, bottom, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left, top - outline, right, bottom - outline, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text:gsub("#%x%x%x%x%x%x", ""), left, top + outline, right, bottom + outline, tocolor (0, 0, 0, 225), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText (text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
end

function isHexadecimal(text)
    return text:match("^[0-9A-Fa-f]+$") ~= nil
end

function createRandomHash(length)
    local hash = ""

    for i = 1, length do
        hash = hash..string.char(math.random(65, 90))
    end

    return hash
end

function trim(s, patterns)
    patterns = patterns or {' ', '\t', '\r', '\n'}

    for i = 1, #patterns do
        s = string.gsub(s, "^" .. patterns[i] .. "*(.-)" .. patterns[i] .. "*$", "%1")
    end

    return s
end

table.merge = function(table1, table2)
    for key, value in pairs(table2) do
        table1[key] = value
    end

    return table1
end