-----------------------------------
-- * Variables
-----------------------------------

ExternalScriptClass = {}
ExternalScriptClass.__index = ExternalScriptClass

-----------------------------------
-- * Functions
-----------------------------------

function ExternalScriptClass.run(runtime, id)
    if (not Script.isExternalScriptLoaded(id)) then
        Script.loadExternalScript(id)
    end

    if (not Script.isExternalScriptLoaded(id)) then
        return runtime:returnBoolean(false)
    end

    local runningCount = Script.getExternalScriptRunningCount(id)

    Script.runExternalScript(id)

    return runtime:returnBoolean(runningCount < Script.getExternalScriptRunningCount(id))
end

Core.mergeInto(ExternalScriptClass, AbstractClass)