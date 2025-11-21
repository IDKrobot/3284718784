local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 13,["20"] = 13,["22"] = 13,["23"] = 24,["24"] = 25,["25"] = 26,["26"] = 24,["27"] = 29,["28"] = 30,["29"] = 31,["30"] = 33,["31"] = 34,["32"] = 35,["34"] = 37,["35"] = 38,["37"] = 39,["40"] = 42,["42"] = 43,["45"] = 46,["47"] = 47,["52"] = 51,["53"] = 51,["54"] = 51,["55"] = 51,["61"] = 29,["63"] = 17,["64"] = 18,["65"] = 18,["66"] = 18,["67"] = 18,["68"] = 18,["69"] = 13});
BehaviorEvent = BehaviorEvent or ({})
BehaviorEvent.START = 0
BehaviorEvent[BehaviorEvent.START] = "START"
BehaviorEvent.UPDATE = 1
BehaviorEvent[BehaviorEvent.UPDATE] = "UPDATE"
BehaviorEvent.END = 2
BehaviorEvent[BehaviorEvent.END] = "END"
CustomIndicator = __TS__Class()
CustomIndicator.name = "CustomIndicator"
function CustomIndicator.prototype.____constructor(self)
end
function CustomIndicator.RegisterAbility(self, ability)
    local ability_index = ability:entindex()
    self.listeners[ability_index] = ability
end
function CustomIndicator.PanoramaListener(self, event)
    local ability = self.listeners[event.ability]
    local behavior_event = event.event
    if ability then
        local pos = Vector(event.worldX, event.worldY, event.worldZ)
        local unit = event.unit and EntIndexToHScript(event.unit)
        repeat
            local ____switch6 = behavior_event
            local ____cond6 = ____switch6 == BehaviorEvent.START
            if ____cond6 then
                ability:CreateCustomIndicator(pos, unit, event.behavior)
                break
            end
            ____cond6 = ____cond6 or ____switch6 == BehaviorEvent.UPDATE
            if ____cond6 then
                ability:UpdateCustomIndicator(pos, unit, event.behavior)
                break
            end
            ____cond6 = ____cond6 or ____switch6 == BehaviorEvent.END
            if ____cond6 then
                ability:DestroyCustomIndicator(pos, unit, event.behavior)
                break
            end
            do
                error(
                    __TS__New(
                        Error,
                        "Unknown event: " .. tostring(behavior_event)
                    ),
                    0
                )
            end
        until true
    end
end;
(function(self)
    self.listeners = {}
    ListenToGameEvent(
        "custom_indicator",
        function(____, event) return self:PanoramaListener(event) end,
        self
    )
end)(CustomIndicator)
