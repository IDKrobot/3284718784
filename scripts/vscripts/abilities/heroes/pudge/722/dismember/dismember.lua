local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__Spread = ____lualib.__TS__Spread
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["12"] = 1,["13"] = 1,["14"] = 2,["15"] = 2,["16"] = 3,["17"] = 3,["18"] = 4,["19"] = 4,["20"] = 6,["21"] = 7,["22"] = 6,["23"] = 7,["25"] = 7,["26"] = 10,["27"] = 14,["28"] = 15,["29"] = 16,["30"] = 14,["31"] = 19,["32"] = 20,["33"] = 19,["34"] = 23,["35"] = 24,["36"] = 25,["37"] = 23,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 32,["42"] = 33,["45"] = 37,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 39,["50"] = 39,["51"] = 39,["52"] = 48,["53"] = 49,["55"] = 28,["56"] = 52,["57"] = 53,["58"] = 54,["60"] = 52,["61"] = 57,["62"] = 58,["63"] = 59,["65"] = 59,["68"] = 57,["69"] = 63,["70"] = 64,["71"] = 66,["72"] = 67,["73"] = 69,["74"] = 70,["75"] = 70,["76"] = 70,["77"] = 70,["78"] = 70,["79"] = 70,["80"] = 70,["81"] = 78,["82"] = 78,["84"] = 80,["85"] = 82,["86"] = 82,["87"] = 82,["88"] = 82,["89"] = 82,["90"] = 82,["91"] = 82,["92"] = 82,["93"] = 63,["94"] = 85,["95"] = 86,["96"] = 88,["97"] = 90,["98"] = 91,["99"] = 92,["100"] = 92,["101"] = 92,["102"] = 92,["103"] = 94,["104"] = 94,["105"] = 95,["106"] = 95,["107"] = 96,["108"] = 96,["109"] = 97,["110"] = 97,["112"] = 99,["113"] = 100,["114"] = 101,["115"] = 101,["116"] = 101,["117"] = 101,["118"] = 102,["120"] = 104,["121"] = 104,["122"] = 104,["123"] = 104,["124"] = 104,["125"] = 104,["126"] = 104,["127"] = 105,["129"] = 107,["130"] = 108,["131"] = 109,["134"] = 109,["138"] = 109,["139"] = 109,["140"] = 109,["141"] = 109,["143"] = 109,["144"] = 111,["145"] = 111,["146"] = 112,["147"] = 112,["149"] = 114,["150"] = 115,["151"] = 116,["154"] = 116,["158"] = 116,["160"] = 116,["161"] = 116,["162"] = 117,["163"] = 118,["164"] = 119,["165"] = 119,["166"] = 119,["167"] = 119,["168"] = 121,["169"] = 121,["170"] = 122,["171"] = 122,["172"] = 123,["173"] = 123,["175"] = 125,["177"] = 127,["180"] = 130,["181"] = 130,["182"] = 130,["183"] = 130,["184"] = 130,["185"] = 130,["186"] = 130,["187"] = 130,["188"] = 130,["189"] = 130,["190"] = 131,["192"] = 134,["193"] = 85,["194"] = 137,["195"] = 138,["196"] = 140,["197"] = 142,["198"] = 143,["199"] = 144,["200"] = 145,["201"] = 146,["202"] = 147,["203"] = 148,["204"] = 149,["205"] = 150,["207"] = 152,["208"] = 153,["209"] = 154,["210"] = 155,["211"] = 155,["212"] = 155,["213"] = 155,["214"] = 155,["215"] = 155,["216"] = 155,["217"] = 156,["218"] = 156,["220"] = 157,["222"] = 159,["223"] = 160,["227"] = 164,["228"] = 165,["229"] = 166,["232"] = 170,["233"] = 171,["235"] = 137,["236"] = 7,["237"] = 7,["238"] = 7,["239"] = 6,["242"] = 7});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local registerAbility = ____dota_ts_adapter.registerAbility
local ____ability_utils = require("lib.ability_utils")
local CustomAbility = ____ability_utils.CustomAbility
local ____modifier_pudge_dismember_custom_722_channel = require("abilities.heroes.pudge.722.dismember.modifier_pudge_dismember_custom_722_channel")
local modifier_pudge_dismember_custom_722_channel = ____modifier_pudge_dismember_custom_722_channel.modifier_pudge_dismember_custom_722_channel
local ____modifier_pudge_dismember_custom_722 = require("abilities.heroes.pudge.722.dismember.modifier_pudge_dismember_custom_722")
local modifier_pudge_dismember_custom_722 = ____modifier_pudge_dismember_custom_722.modifier_pudge_dismember_custom_722
____exports.pudge_dismember_custom_722 = __TS__Class()
local pudge_dismember_custom_722 = ____exports.pudge_dismember_custom_722
pudge_dismember_custom_722.name = "pudge_dismember_custom_722"
__TS__ClassExtends(pudge_dismember_custom_722, CustomAbility)
function pudge_dismember_custom_722.prototype.____constructor(self)
    CustomAbility.prototype.____constructor(self, "pudge_dismember")
end
function pudge_dismember_custom_722.prototype.Precache(self, context)
    context:AddResource("soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts")
    context:AddResource("soundevents/voscripts/game_sounds_vo_pudge.vsndevts")
end
function pudge_dismember_custom_722.prototype.GetIntrinsicModifierName(self)
    return modifier_pudge_dismember_custom_722_channel.name
end
function pudge_dismember_custom_722.prototype.GetChannelTime(self)
    local caster = self:GetCaster()
    return caster:GetModifierStackCount(modifier_pudge_dismember_custom_722_channel.name, caster) * 0.01
end
function pudge_dismember_custom_722.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target or target:TriggerSpellAbsorb(self) then
        caster:Interrupt()
        return
    end
    self.target = target
    modifier_pudge_dismember_custom_722:apply(
        target,
        caster,
        self,
        {duration = self:GetChannelTime()}
    )
    if caster:GetUnitName() == "npc_dota_hero_pudge" then
        self:EmitPhraseStart()
    end
end
function pudge_dismember_custom_722.prototype.OnChannelThink(self, interval)
    if self.target and not self.target:IsAlive() then
        self:GetCaster():InterruptChannel()
    end
end
function pudge_dismember_custom_722.prototype.OnChannelFinish(self, interrupted)
    if self.target then
        local ____opt_0 = self.target:FindModifierByName(modifier_pudge_dismember_custom_722.name)
        if ____opt_0 ~= nil then
            ____opt_0:Destroy()
        end
    end
end
function pudge_dismember_custom_722.prototype.DealDamage(self, target, tick)
    local caster = self:GetCaster()
    local baseDamage = self:GetSpecialValueFor("dismember_damage")
    local strengthDamage = self:GetSpecialValueFor("strength_damage")
    local damage = (baseDamage + caster:GetStrength() * strengthDamage) * tick
    local damageTable = {
        attacker = caster,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        victim = target,
        ability = self
    }
    if not target:IsAlive() and caster:GetUnitName() == "npc_dota_hero_pudge" then
        self:EmitPhraseKill(target)
    end
    local damageDealt = ApplyDamage(damageTable)
    caster:HealWithParams(
        damageDealt,
        self,
        false,
        true,
        caster,
        true
    )
end
function pudge_dismember_custom_722.prototype.EmitPhraseStart(self)
    local caster = self:GetCaster()
    local soundName = ""
    if caster:HasArcana("npc_dota_hero_pudge") then
        if RollPercentage(57) then
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 2, 24))
            )
            if random == "05" and RollPercentage(50) then
                random = "05_01"
            elseif random == "07" and RollPercentage(50) then
                random = "07_01"
            elseif random == "19" and RollPercentage(33) then
                random = "19_01"
            elseif random == "19" and RollPercentage(33) then
                random = "19_05"
            end
            soundName = "pudge_pud_arc_ability_devour_" .. random
        elseif RollPercentage(44) then
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 9))
            )
            soundName = "pudge_pud_arc_ability_dismember_" .. random
        else
            local random = RollVoiceLines(
                nil,
                3,
                12,
                13,
                15
            )
            soundName = "pudge_pud_arc_ability_dismember_laugh_" .. random
        end
    elseif caster:HasPersona("npc_dota_hero_pudge") then
        if RollPercentage(55) then
            local ____RollVoiceLines_3 = RollVoiceLines
            local ____array_2 = __TS__SparseArrayNew(
                nil,
                __TS__Spread(range(nil, 1, 15))
            )
            __TS__SparseArrayPush(
                ____array_2,
                17,
                19,
                20,
                21
            )
            local random = ____RollVoiceLines_3(__TS__SparseArraySpread(____array_2))
            if random == "20" then
                random = "20_02"
            elseif random == "21" then
                random = "21_02"
            end
            soundName = "pudge_toy_pug_ability_devour_" .. random
        elseif RollPercentage(36) then
            local ____RollVoiceLines_5 = RollVoiceLines
            local ____array_4 = __TS__SparseArrayNew(
                nil,
                __TS__Spread(range(nil, 1, 3))
            )
            __TS__SparseArrayPush(
                ____array_4,
                __TS__Spread(range(nil, 5, 7))
            )
            __TS__SparseArrayPush(____array_4, 9)
            local random = ____RollVoiceLines_5(__TS__SparseArraySpread(____array_4))
            soundName = "pudge_toy_pug_ability_dismember_" .. random
        elseif RollPercentage(50) then
            local random = RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 4))
            )
            if random == "01" and RollPercentage(50) then
                random = "01_02"
            elseif random == "02" and RollPercentage(50) then
                random = "02_02"
            elseif random == "03" and RollPercentage(50) then
                random = "03_02"
            end
            soundName = "pudge_toy_pug_ability_dismember_laugh_" .. random
        else
            soundName = "pudge_toy_pug_friend_01_02"
        end
    else
        local random = RollVoiceLines(
            nil,
            2,
            3,
            4,
            7,
            12,
            15,
            16
        )
        soundName = "pudge_pud_ability_devour_" .. random
    end
    caster:EmitSoundOnClient(soundName)
end
function pudge_dismember_custom_722.prototype.EmitPhraseKill(self, target)
    local caster = self:GetCaster()
    local soundName = ""
    if caster:HasArcana("npc_dota_hero_pudge") then
        if RollPercentage(30) then
            local random = RollVoiceLines(nil, 4, 8)
            soundName = "pudge_pud_arc_ability_dismember_" .. random
        elseif RollPercentage(25) then
            soundName = "pudge_pud_arc_ability_devour_17"
        elseif RollPercentage(20) then
            local random = RollVoiceLines(nil, 9, 14)
            soundName = "pudge_pud_arc_ability_devour_" .. random
        end
    elseif caster:HasPersona("npc_dota_hero_pudge") then
        if RollPercentage(30) then
            if RollPercentage(50) then
                local random = RollVoiceLines(
                    nil,
                    16,
                    18,
                    22,
                    23
                )
                if random == "16" then
                    random = "16_02"
                end
                soundName = "pudge_toy_pug_ability_devour_" .. random
            else
                local random = RollVoiceLines(nil, 4, 8)
                soundName = "pudge_toy_pug_ability_dismember_" .. random
            end
        end
    else
        if RollPercentage(10) then
            local random = RollVoiceLines(nil, 8, 9, 14)
            soundName = "pudge_pud_ability_devour_" .. random
        end
    end
    if soundName ~= "" then
        caster:EmitSoundOnClient(soundName)
    end
end
pudge_dismember_custom_722 = __TS__Decorate(
    pudge_dismember_custom_722,
    pudge_dismember_custom_722,
    {registerAbility(nil)},
    {kind = "class", name = "pudge_dismember_custom_722"}
)
____exports.pudge_dismember_custom_722 = pudge_dismember_custom_722
return ____exports
