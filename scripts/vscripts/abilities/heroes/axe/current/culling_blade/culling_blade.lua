local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Spread = ____lualib.__TS__Spread
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 4,["16"] = 5,["17"] = 4,["18"] = 5,["19"] = 8,["20"] = 9,["21"] = 10,["22"] = 11,["25"] = 13,["28"] = 15,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 20,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 22,["39"] = 17,["40"] = 26,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 34,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 37,["55"] = 38,["58"] = 40,["59"] = 42,["60"] = 44,["61"] = 44,["63"] = 36,["64"] = 36,["66"] = 47,["67"] = 49,["68"] = 49,["69"] = 49,["70"] = 50,["73"] = 51,["76"] = 53,["77"] = 55,["78"] = 55,["80"] = 49,["81"] = 49,["83"] = 8,["84"] = 60,["85"] = 61,["86"] = 63,["87"] = 65,["88"] = 67,["89"] = 68,["90"] = 70,["91"] = 71,["92"] = 75,["94"] = 77,["95"] = 78,["97"] = 81,["98"] = 86,["99"] = 87,["100"] = 87,["101"] = 87,["102"] = 87,["103"] = 87,["104"] = 88,["105"] = 89,["107"] = 91,["108"] = 93,["109"] = 95,["110"] = 96,["112"] = 98,["113"] = 99,["114"] = 100,["116"] = 103,["117"] = 104,["118"] = 105,["119"] = 106,["120"] = 107,["123"] = 111,["124"] = 113,["125"] = 122,["126"] = 122,["127"] = 122,["128"] = 122,["129"] = 122,["130"] = 122,["131"] = 122,["132"] = 122,["133"] = 122,["134"] = 122,["135"] = 122,["136"] = 122,["137"] = 132,["138"] = 133,["139"] = 122,["140"] = 122,["142"] = 60,["143"] = 145,["144"] = 146,["145"] = 148,["146"] = 149,["147"] = 150,["148"] = 150,["149"] = 150,["150"] = 150,["152"] = 152,["153"] = 153,["155"] = 155,["159"] = 159,["160"] = 160,["162"] = 162,["165"] = 145,["166"] = 5,["167"] = 5,["168"] = 5,["169"] = 4,["172"] = 5});
local ____exports = {}
local ____dota_ts_adapter = require("lib.dota_ts_adapter")
local BaseAbility = ____dota_ts_adapter.BaseAbility
local registerAbility = ____dota_ts_adapter.registerAbility
local ____modifier_axe_culling_blade_custom = require("abilities.heroes.axe.current.culling_blade.modifier_axe_culling_blade_custom")
local modifier_axe_culling_blade_custom = ____modifier_axe_culling_blade_custom.modifier_axe_culling_blade_custom
____exports.axe_culling_blade = __TS__Class()
local axe_culling_blade = ____exports.axe_culling_blade
axe_culling_blade.name = "axe_culling_blade"
__TS__ClassExtends(axe_culling_blade, BaseAbility)
function axe_culling_blade.prototype.OnSpellStart(self)
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    if not target then
        return
    end
    if target:TriggerSpellAbsorb(self) then
        return
    end
    local damage = self:GetSpecialValueFor("damage")
    local function runResponse()
        if caster:GetUnitName() == "npc_dota_hero_axe" then
            if self.castTimer then
                Timers:RemoveTimer(self.castTimer)
            end
            self.castTimer = Timers:CreateTimer(
                3,
                function() return self:CastResponse() end
            )
        end
    end
    if target:GetHealth() > damage then
        local damageTable = {
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_PURE,
            victim = target,
            ability = self
        }
        ApplyDamage(damageTable)
        Timers:CreateTimer(
            FrameTime(),
            function()
                if not self or self:IsNull() then
                    return
                end
                if not target or target:IsNull() then
                    return
                end
                local isDead = not target:IsAlive()
                self:CullingKill(target, isDead)
                if isDead then
                    runResponse(nil)
                end
            end
        )
    else
        target:KillWithExceptions(self, caster)
        Timers:CreateTimer(
            FrameTime(),
            function()
                if not self or self:IsNull() then
                    return
                end
                if not target or target:IsNull() then
                    return
                end
                self:CullingKill(target, true)
                if not target:IsAlive() then
                    runResponse(nil)
                end
            end
        )
    end
end
function axe_culling_blade.prototype.CullingKill(self, target, success)
    local caster = self:GetCaster()
    local isJungle = caster:HasWearable("models/items/axe/ti9_jungle_axe/axe_bare.vmdl")
    local direction = target:GetAbsOrigin():__sub(caster:GetAbsOrigin()):Normalized()
    local particle_name
    local sound_name
    if success then
        particle_name = isJungle and "particles/econ/items/axe/ti9_jungle_axe/ti9_jungle_axe_culling_blade_kill.vpcf" or "particles/units/heroes/hero_axe/axe_culling_blade_kill.vpcf"
        sound_name = "Hero_Axe.Culling_Blade_Success"
    else
        particle_name = "particles/units/heroes/hero_axe/axe_culling_blade.vpcf"
        sound_name = "Hero_Axe.Culling_Blade_Fail"
    end
    local particle = ParticleManager:CreateParticle(particle_name, PATTACH_ABSORIGIN_FOLLOW, target)
    if success then
        ParticleManager:SetParticleControl(
            particle,
            4,
            target:GetAbsOrigin()
        )
        ParticleManager:SetParticleControlForward(particle, 3, direction)
        ParticleManager:SetParticleControlForward(particle, 4, direction)
    end
    ParticleManager:ReleaseParticleIndex(particle)
    target:EmitSound(sound_name)
    if isJungle then
        caster:EmitSound("Hero_Axe.JungleWeapon.Dunk")
    end
    if success then
        if target:IsHero() then
            self:EndCooldown()
        end
        if target:IsFullyRealHero() then
            local coat_of_blood = caster:FindModifierByName("modifier_axe_coat_of_blood")
            if coat_of_blood then
                coat_of_blood:IncrementStackCount()
                coat_of_blood:IncrementStackCount()
            end
        end
        local duration = self:GetSpecialValueFor("speed_duration")
        modifier_axe_culling_blade_custom:apply(caster, caster, self, {duration = duration})
        __TS__ArrayForEach(
            FindUnitsInRadius(
                caster:GetTeamNumber(),
                caster:GetAbsOrigin(),
                nil,
                self:GetSpecialValueFor("speed_aoe"),
                1,
                bit.bor(1, 18),
                0,
                0,
                false
            ),
            function(____, ally)
                modifier_axe_culling_blade_custom:apply(ally, caster, self, {duration = duration})
            end
        )
    end
end
function axe_culling_blade.prototype.CastResponse(self)
    local caster = self:GetCaster()
    if caster:HasWearable("models/items/axe/ti9_jungle_axe/axe_bare.vmdl") then
        if RollPercentage(60) then
            caster:EmitSoundOnClient("axe_jung_axe_ability_cullingblade_" .. RollVoiceLines(
                nil,
                __TS__Spread(range(nil, 1, 4))
            ))
        else
            if RollPercentage(50) then
                caster:EmitSoundOnClient("axe_jung_axe_deny_15")
            else
                caster:EmitSoundOnClient("axe_jung_axe_deny_16_02")
            end
        end
    else
        if RollPercentage(33) then
            caster:EmitSoundOnClient("axe_axe_ability_cullingblade_01")
        else
            caster:EmitSoundOnClient("axe_axe_deny_" .. RollVoiceLines(nil, 15, 16))
        end
    end
end
axe_culling_blade = __TS__Decorate(
    axe_culling_blade,
    axe_culling_blade,
    {registerAbility(nil)},
    {kind = "class", name = "axe_culling_blade"}
)
____exports.axe_culling_blade = axe_culling_blade
return ____exports
