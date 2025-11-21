local ____lualib = require("lualib_bundle")
local __TS__Generator = ____lualib.__TS__Generator
local __TS__StringPadStart = ____lualib.__TS__StringPadStart
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["11"] = 2,["12"] = 3,["13"] = 4,["16"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["22"] = 7,["27"] = 8,["28"] = 7,["31"] = 1,["32"] = 11,["33"] = 12,["34"] = 11,["35"] = 15,["36"] = 15,["37"] = 16,["38"] = 16,["40"] = 18,["41"] = 19,["42"] = 19,["44"] = 20,["45"] = 20,["46"] = 20,["47"] = 20,["48"] = 20,["49"] = 15,["50"] = 23,["51"] = 24,["52"] = 31,["53"] = 31,["54"] = 31,["55"] = 31,["56"] = 23});
range = __TS__Generator(function(self, start, stop, step)
    if step == nil then
        step = 1
    end
    if stop == nil then
        stop = start
        start = 0
    end
    do
        local i = start
        while true do
            local ____temp_0
            if step > 0 then
                ____temp_0 = i <= stop
            else
                ____temp_0 = i >= stop
            end
            if not ____temp_0 then
                break
            end
            coroutine.yield(i)
            i = i + step
        end
    end
end)
function BoolToNum(self, bool)
    return bool and 1 or 0
end
function RollVoiceLines(self, ...)
    local lines = {...}
    if lines == nil or #lines == 0 then
        return "00"
    end
    local line = lines[RandomInt(0, #lines - 1) + 1]
    if line <= 0 or line >= 100 then
        error("function RollVoiceLines: line number can't be 0 or greater then 99", 0)
    end
    return __TS__StringPadStart(
        tostring(line),
        2,
        "0"
    )
end
function HasWearable(self, wearables, wearableName, style)
    local HASH_STYLES = {[1977497166] = 0, [1055040020] = 0, [628863847] = 1, [1347516877] = 2}
    return __TS__ArraySome(
        wearables,
        function(____, wearable) return wearable.modelName == wearableName and (not style or HASH_STYLES[wearable.material] == style) end
    )
end
