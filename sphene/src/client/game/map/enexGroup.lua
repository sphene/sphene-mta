EnexGroup = {
    groups = {}
}
EnexGroup.__index = EnexGroup

-----------------------------------
-- * Functions
-----------------------------------

function EnexGroup:create(name)
    local mt = setmetatable({}, EnexGroup)

    mt.name = name
    mt.enexes = {}

    return mt
end

function EnexGroup:addEnex(enex)
    self.enexes[#self.enexes + 1] = enex

    Logger.debug('ENEX GROUP', 'Adding Enex to group \'{}\'', self.name)

    enex:setGroup(self)
end

function EnexGroup:removeEnex(enex)
    for i=1, #self.enexes do
        if (self.enexes[i] == enex) then
            enex:setGroup(false)
            table.remove(self.enexes, i)
            break
        end
    end
end

function EnexGroup:getEnexes()
    return self.enexes
end

function EnexGroup:getEnexesCount()
    return #self.enexes
end

function EnexGroup.createGroup(name)
    if EnexGroup.groups[name] then
        return EnexGroup.groups[name]
    end

    Logger.info('ENEX GROUP', 'Creating EnexGroup with name \'{}\'', name)

    local group = EnexGroup:create(name)

    EnexGroup.groups[name] = group

    return group
end

function EnexGroup.removeGroup(name)
    if not EnexGroup.groups[name] then
        return
    end

    Logger.info('ENEX GROUP', 'Removing EnexGroup with name \'{}\'', name)

    EnexGroup.groups[name] = nil
end