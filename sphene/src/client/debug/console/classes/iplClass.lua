-----------------------------------
-- * Variables
-----------------------------------

IPLClass = {}
IPLClass.__index = IPLClass

-----------------------------------
-- * Functions
-----------------------------------

function IPLClass.load(runtime, group)
    local mt = setmetatable({}, IPLClass)

    mt.runtime = runtime
    mt.ipl = IPL.loadGroup(group)

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function IPLClass:unload(_)
    if (self.ipl) then
        self.ipl:unload()
    end
end

function IPLClass:__initializeProperties()
    self.properties = {}
end

function IPLClass.__preinit(_)

end

Core.mergeInto(IPLClass, AbstractClass)