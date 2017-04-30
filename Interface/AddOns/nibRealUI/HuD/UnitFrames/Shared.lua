local _, private = ...

-- Libs --
local oUF = _G.oUFembed

-- RealUI --
local RealUI = private.RealUI
local db, ndb

local UnitFrames = RealUI:GetModule("UnitFrames")
local CombatFader = RealUI:GetModule("CombatFader")
local round = RealUI.Round
UnitFrames.textures = {
    [1] = {
        F1 = { -- Player / Target Frames
            health = {
                width = 222,
                height = 13,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Health_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Health_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Health_Step]=],
                warn = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Health_Warning]=],
            },
            power = {
                width = 197,
                height = 8,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Power_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Power_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Power_Step]=],
                warn = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Power_Warning]=],
            },
            healthBox = { -- PvP Status / Classification
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_HealthBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_HealthBox_Surround]=],
            },
            statusBox = { -- Combat, Resting, Leader, AFK
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_StatusBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_StatusBox_Surround]=],
            },
            endBox = { -- Tapped, Hostile, Friendly
                width = 32,
                height = 32,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_EndBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_EndBox_Surround]=],
            },
            tanking = {
                width = 32,
                height = 32,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Tanking_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Tanking_Surround]=],
            },
            range = {
                width = 32,
                height = 32,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Range_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F1_Range_Surround]=],
            },
        },
        F2 = { -- Focus / Target Target
            health = {
                width = 116,
                height = 9,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_Health_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_Health_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_Health_Step]=],
            },
            healthBox = { -- PvP Status / Classification
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_HealthBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_HealthBox_Surround]=],
            },
            statusBox = { -- Combat, Resting, Leader, AFK
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_StatusBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_StatusBox_Surround]=],
            },
            endBox = { -- Tapped, Hostile, Friendly
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_EndBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F2_EndBox_Surround]=],
            },
        },
        F3 = { -- Focus Target / Pet
            health = {
                width = 105,
                height = 9,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_Health_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_Health_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_Health_Step]=],
            },
            healthBox = { -- PvP Status / Classification
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_HealthBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_HealthBox_Surround]=],
            },
            endBox = { -- Tapped, Hostile, Friendly
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_EndBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\1\F3_EndBox_Surround]=],
            },
        },
    },
    [2] = {
        F1 = { -- Player / Target Frames
            health = {
                width = 259,
                height = 15,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Health_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Health_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Health_Step]=],
                warn = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Health_Warning]=],
            },
            power = {
                width = 230,
                height = 10,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Power_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Power_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Power_Step]=],
                warn = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Power_Warning]=],
            },
            healthBox = { -- PvP Status / Classification
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_HealthBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_HealthBox_Surround]=],
            },
            statusBox = { -- Combat, Resting, Leader, AFK
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_StatusBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_StatusBox_Surround]=],
            },
            endBox = { -- Tapped, Hostile, Friendly
                width = 32,
                height = 32,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_EndBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_EndBox_Surround]=],
            },
            tanking = {
                width = 32,
                height = 32,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Tanking_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Tanking_Surround]=],
            },
            range = {
                width = 32,
                height = 32,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Range_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F1_Range_Surround]=],
            },
        },
        F2 = { -- Focus / Target Target
            health = {
                width = 138,
                height = 10,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_Health_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_Health_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_Health_Step]=],
            },
            healthBox = { -- PvP Status / Classification
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_HealthBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_HealthBox_Surround]=],
            },
            statusBox = { -- Combat, Resting, Leader, AFK
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_StatusBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_StatusBox_Surround]=],
            },
            endBox = { -- Tapped, Hostile, Friendly
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_EndBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F2_EndBox_Surround]=],
            },
        },
        F3 = { -- Focus Target / Pet
            health = {
                width = 126,
                height = 10,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_Health_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_Health_Surround]=],
                step = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_Health_Step]=],
            },
            healthBox = { -- PvP Status / Classification
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_HealthBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_HealthBox_Surround]=],
            },
            endBox = { -- Tapped, Hostile, Friendly
                width = 16,
                height = 16,
                bar = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_EndBox_Bar]=],
                border = [=[Interface\AddOns\nibRealUI\HuD\UnitFrames\Media\2\F3_EndBox_Surround]=],
            },
        },
    },
}

-- Power types where the default state is empty
RealUI.ReversePowers = {
    ["RAGE"] = true,
    ["RUNIC_POWER"] = true,
    ["POWER_TYPE_SUN_POWER"] = true,
    ["LUNAR_POWER"] = true,
    ["INSANITY"] = true,
    ["MAELSTROM"] = true,
    ["FURY"] = true,
    ["PAIN"] = true,
}
local function GetVertices(info, useOther)
    local side = info.point
    if useOther then
        side = side == "RIGHT" and "LEFT" or "RIGHT"
    end

    if side == "RIGHT" then
        return (info.rightVertex % 2) + 1, info.rightVertex
    else
        return info.leftVertex, (info.leftVertex % 2) + 3
    end
end

local function CreateSteps(parent, height, info)
    local stepHeight = round(height / 2)
    local step, warn = {}, {}

    for i = 1, 2 do
        local leftVertex, rightVertex = GetVertices(info)
        local s = parent:CreateAngle("Frame", nil, parent.overlay)
        s:SetSize(2, stepHeight)
        s:SetAngleVertex(leftVertex, rightVertex)
        s:SetBackgroundColor(.5, .5, .5, RealUI.media.background[4])
        step[i] = s

        local w = parent:CreateAngle("Frame", nil, parent.overlay)
        w:SetSize(2, height)
        w:SetAngleVertex(leftVertex, rightVertex)
        w:SetBackgroundColor(.5, .5, .5, RealUI.media.background[4])
        warn[i] = w
    end
    return step, warn
end
local function PositionSteps(self, vert)
    local width, height = self:GetSize()
    local isRight = self:GetReverseFill()
    local point, relPoint = vert..(isRight and "RIGHT" or "LEFT"), vert..(isRight and "LEFT" or "RIGHT")
    local stepPoints = UnitFrames.steppoints[self.barType][RealUI.class] or UnitFrames.steppoints.default
    for i = 1, 2 do
        local xOfs = round(stepPoints[i] * (width - 10))
        if self:GetReversePercent() then
            xOfs = (xOfs + height) * (isRight and 1 or -1)
            self.step[i]:SetPoint(point, self, relPoint, xOfs, 0)
            self.warn[i]:SetPoint(point, self, relPoint, xOfs, 0)
        else
            xOfs = xOfs * (isRight and -1 or 1)
            self.step[i]:SetPoint(point, self, xOfs, 0)
            self.warn[i]:SetPoint(point, self, xOfs, 0)
        end
    end
end
local function UpdateSteps(self, unit, cur, max)
    UnitFrames:debug("UnitFrames:UpdateSteps", unit, cur, max)
    --cur = max * .25
    --self:SetValue(cur)
    local percent = RealUI:GetSafeVals(cur, max)
    local stepPoints = UnitFrames.steppoints[self.barType][RealUI.class] or UnitFrames.steppoints.default
    for i = 1, 2 do
        --print(percent, unit, cur, max, self.colorClass)
        if self:GetReversePercent() then
            --print("step reverse")
            if percent > stepPoints[i] then
                self.step[i]:SetAlpha(1)
                self.warn[i]:SetAlpha(0)
            else
                self.step[i]:SetAlpha(0)
                self.warn[i]:SetAlpha(1)
            end
        else
            --print("step normal")
            if percent < stepPoints[i] then
                self.step[i]:SetAlpha(0)
                self.warn[i]:SetAlpha(1)
            else
                self.step[i]:SetAlpha(1)
                self.warn[i]:SetAlpha(0)
            end
        end
    end
end

local function CreateHealthBar(parent, unit, info)
    local width, height = parent:GetWidth(), parent:GetHeight()
    if db.units[unit].healthHeight then
        height = round((height - 3) * db.units[unit].healthHeight)
    end
    local health = parent:CreateAngle("StatusBar", nil, parent.overlay)
    health:SetSize(width, height)
    health:SetPoint("TOP"..info.point, parent)
    health:SetReverseFill(info.point == "RIGHT")
    health:SetReversePercent(not ndb.settings.reverseUnitFrameBars)
    health:SetAngleVertex(info.leftVertex, info.rightVertex)

    if info.text then
        health.text = health:CreateFontString(nil, "OVERLAY")
        health.text:SetPoint("BOTTOM"..info.point, health, "TOP"..info.point, 2, 2)
        health.text:SetFontObject(_G.RealUIFont_Pixel)
        parent:Tag(health.text, "[realui:health]")
    end

    health.step, health.warn = CreateSteps(parent, height, info)
    health.barType = "health"
    health.colorClass = db.overlay.classColor
    health.colorHealth = true
    health.frequentUpdates = true

    health.PositionSteps = PositionSteps
    health.PostUpdate = UpdateSteps
    parent.Health = health
end
local CreateHealthStatus do
    local classification = {
        rareelite = {1, 0.5, 0},
        elite = {1, 1, 0},
        rare = {0.75, 0.75, 0.75},
    }

    local function UpdatePvP(self, event, unit)
        local pvp, color = self.PvP
        if _G.UnitIsPVP(unit) then
            local reaction = _G.UnitReaction(unit, "player")
            if not reaction then
                -- Can be nil if the target is out of range
                reaction = _G.UnitIsFriend(unit,"player") and 5 or 2
            end
            color = self.colors.reaction[reaction]
            pvp:SetBackgroundColor(color[1], color[2], color[3], color[4])
        else
            color = RealUI.media.background
            pvp:SetBackgroundColor(color[1], color[2], color[3], color[4])
        end
    end
    local function UpdateClassification(self, event)
        local color = classification[_G.UnitClassification(self.unit)] or RealUI.media.background
        self.Classification:SetBackgroundColor(color[1], color[2], color[3], color[4])
    end

    function CreateHealthStatus(parent, unit, info)
        local leftVertex, rightVertex = GetVertices(info)
        local width, height = 4, _G.ceil(parent.Health:GetHeight() * 0.65)
        local pvp = parent:CreateAngle("Frame", nil, parent.Health)
        pvp:SetSize(width, height)
        pvp:SetPoint("TOP"..info.point, parent.Health, info.point == "RIGHT" and -8 or 8, 0)
        pvp:SetAngleVertex(leftVertex, rightVertex)

        pvp.Override = UpdatePvP
        parent.PvP = pvp

        if not (unit == "player" or unit == "pet") then
            local class = parent:CreateAngle("Frame", nil, parent.Health)
            class:SetSize(width, height)
            class:SetPoint("TOP"..info.point, parent.Health, info.point == "RIGHT" and -16 or 16, 0)
            class:SetAngleVertex(leftVertex, rightVertex)

            class.Update = UpdateClassification
            parent.Classification = class
            parent:RegisterEvent("UNIT_CLASSIFICATION_CHANGED", UpdateClassification)
        end
    end
end

local CreateHealthPredictBar do
    local function PredictOverride(self, event, unit)
        if(self.unit ~= unit) then return end

        local hp = self.HealPrediction
        local healthBar = self.Health

        local myIncomingHeal = _G.UnitGetIncomingHeals(unit, 'player') or 0
        local allIncomingHeal = _G.UnitGetIncomingHeals(unit) or 0
        local totalAbsorb = _G.UnitGetTotalAbsorbs(unit) or 0
        local myCurrentHealAbsorb = _G.UnitGetTotalHealAbsorbs(unit) or 0
        local health, maxHealth = _G.UnitHealth(unit), _G.UnitHealthMax(unit)

        --local overHealAbsorb = false
        if (health < myCurrentHealAbsorb) then
            --overHealAbsorb = true
            myCurrentHealAbsorb = health
        end

        if (health - myCurrentHealAbsorb + allIncomingHeal > maxHealth * hp.maxOverflow) then
            allIncomingHeal = maxHealth * hp.maxOverflow - health + myCurrentHealAbsorb
        end

        local otherIncomingHeal = 0
        if (allIncomingHeal < myIncomingHeal) then
            myIncomingHeal = allIncomingHeal
        else
            otherIncomingHeal = allIncomingHeal - myIncomingHeal
        end

        local overAbsorb, atMax
        if healthBar:GetReversePercent() then
            if (totalAbsorb >= health) then
                overAbsorb = true

                if (allIncomingHeal > myCurrentHealAbsorb) then
                    totalAbsorb = _G.max(0, health - myCurrentHealAbsorb + allIncomingHeal)
                else
                    totalAbsorb = _G.max(0, health)
                end
            end
            atMax = health == maxHealth
        else
            if (health - myCurrentHealAbsorb + allIncomingHeal + totalAbsorb >= maxHealth or health + totalAbsorb >= maxHealth) then
                if (totalAbsorb > 0) then
                    overAbsorb = true
                end

                if (allIncomingHeal > myCurrentHealAbsorb) then
                    totalAbsorb = _G.max(0, maxHealth - (health - myCurrentHealAbsorb + allIncomingHeal))
                else
                    totalAbsorb = _G.max(0, maxHealth - health)
                end
            end
        end

        if (myCurrentHealAbsorb > allIncomingHeal) then
            myCurrentHealAbsorb = myCurrentHealAbsorb - allIncomingHeal
        else
            myCurrentHealAbsorb = 0
        end

        if (hp.myBar) then
            hp.myBar:SetMinMaxValues(0, maxHealth)
            hp.myBar:SetValue(myIncomingHeal)
        end

        if (hp.otherBar) then
            hp.otherBar:SetMinMaxValues(0, maxHealth)
            hp.otherBar:SetValue(otherIncomingHeal)
        end

        if (hp.absorbBar) then
            hp.absorbBar:SetMinMaxValues(0, maxHealth)
            hp.absorbBar:SetValue(totalAbsorb)
            hp.absorbBar:ClearAllPoints()
            local fill = healthBar:GetStatusBarTexture()
            if healthBar:GetReverseFill() then
                if atMax then
                    hp.absorbBar:SetPoint("TOPRIGHT", healthBar)
                else
                    hp.absorbBar:SetPoint("TOPRIGHT", fill, "TOPLEFT", fill:GetHeight(), 0)
                end
                if overAbsorb then
                    hp.absorbBar:SetPoint("TOPLEFT", healthBar)
                end
            else
                if atMax then
                    hp.absorbBar:SetPoint("TOPLEFT", healthBar)
                else
                    hp.absorbBar:SetPoint("TOPLEFT", fill, "TOPRIGHT", -fill:GetHeight(), 0)
                end
                if overAbsorb then
                    hp.absorbBar:SetPoint("TOPRIGHT", healthBar)
                end
            end
        end

        if (hp.healAbsorbBar) then
            hp.healAbsorbBar:SetMinMaxValues(0, maxHealth)
            hp.healAbsorbBar:SetValue(myCurrentHealAbsorb)
        end
    end
    function CreateHealthPredictBar(parent, unit, info)
        local width, height = parent.Health:GetSize()
        local absorbBar = parent:CreateAngle("StatusBar", nil, parent.Health)
        absorbBar:SetSize(width, height)
        absorbBar:SetBackgroundColor(0, 0, 0, 0)
        absorbBar:SetBackgroundBorderColor(0, 0, 0, 0)
        absorbBar:SetStatusBarColor(1, 1, 1, db.overlay.bar.opacity.absorb)
        absorbBar:SetAngleVertex(info.leftVertex, info.rightVertex)
        absorbBar:SetReverseFill(parent.Health:GetReverseFill())
        absorbBar:SetFrameLevel(parent.Health:GetFrameLevel())

        parent.HealPrediction = {
            frequentUpdates = true,
            maxOverflow = 1,
            absorbBar = absorbBar,
            Override = PredictOverride,
        }
    end
end

local function CreatePowerBar(parent, unit, info)
    local width, height = round(parent:GetWidth() * 0.9), round((parent:GetHeight() - 3) * (1 - db.units[unit].healthHeight))
    local power = parent:CreateAngle("StatusBar", nil, parent.overlay)
    power:SetSize(width, height)
    power:SetPoint("BOTTOM"..info.point, parent, info.point == "RIGHT" and -5 or 5, 0)
    power:SetAngleVertex(info.leftVertex, info.rightVertex)
    power:SetReverseFill(info.point == "RIGHT")

    power.text = power:CreateFontString(nil, "OVERLAY")
    power.text:SetPoint("TOP"..info.point, power, "BOTTOM"..info.point, 2, -3)
    power.text:SetFontObject(_G.RealUIFont_Pixel)
    parent:Tag(power.text, "[realui:power]")

    power.step, power.warn = CreateSteps(parent, height, info)
    power.barType = "power"
    power.colorPower = true
    power.frequentUpdates = true

    local powerType
    function power:UpdateReverse()
        if ndb.settings.reverseUnitFrameBars then
            power:SetReversePercent(RealUI.ReversePowers[powerType])
        else
            power:SetReversePercent(not RealUI.ReversePowers[powerType])
        end
    end
    power.PositionSteps = PositionSteps
    function power:PostUpdate(unitToken, cur, max, min)
        UpdateSteps(self, unitToken, cur, max)
        local _, pType = _G.UnitPowerType(parent.unit)
        if pType ~= powerType then
            powerType = pType
            power:UpdateReverse()
        end
    end
    parent.Power = power
end
local CreatePowerStatus do
    local status = {
        afk = {1, 1, 0},
        offline = oUF.colors.disconnected,
        leader = {0, 1, 1},
        combat = {1, 0, 0},
        resting = {0, 1, 0},
    }
    local function UpdateStatus(self, event, ...)
        local unit, color = self.unit

        if _G.UnitIsAFK(unit) then
            self.Leader.status = "afk"
        elseif not(_G.UnitIsConnected(unit)) then
            self.Leader.status = "offline"
        elseif _G.UnitIsGroupLeader(unit) then
            self.Leader.status = "leader"
        else
            self.Leader.status = false
        end

        if self.Leader.status then
            color = status[self.Leader.status]
            self.Leader:SetBackgroundColor(color[1], color[2], color[3], color[4])
            self.Leader:Show()
        else
            self.Leader:Hide()
        end

        if _G.UnitAffectingCombat(unit) then
            self.Combat.status = "combat"
        elseif _G.IsResting(unit) then
            self.Combat.status = "resting"
        else
            self.Combat.status = false
        end

        if self.Leader.status and not self.Combat.status then
            color = RealUI.media.background
            self.Combat:SetBackgroundColor(color[1], color[2], color[3], color[4])
            self.Combat:Show()
        elseif self.Combat.status then
            color = status[self.Combat.status]
            self.Combat:SetBackgroundColor(color[1], color[2], color[3], color[4])
            self.Combat:Show()
        else
            self.Combat:Hide()
        end
    end

    function CreatePowerStatus(parent, unit, data)
        local point, anchor, relPoint, x, info
        if data.power then
            info, anchor = data.power, parent.Power
        else
            info, anchor = data.health, parent.Health
        end
        if info.point == "LEFT" then
            point, relPoint, x = "TOPLEFT", "TOPRIGHT", -8
        else
            point, relPoint, x = "TOPRIGHT", "TOPLEFT", 8
        end
        local leftVertex, rightVertex = GetVertices(info, not data.isBig)
        local width, height = 4, anchor:GetHeight()


        local CombatRest = parent:CreateAngle("Frame", nil, anchor)
        CombatRest:SetSize(width, height)
        CombatRest:SetPoint(point, anchor, relPoint, x, 0)
        CombatRest:SetAngleVertex(leftVertex, rightVertex)
        CombatRest.Override = UpdateStatus
        parent.Combat = CombatRest
        parent.Rest = CombatRest

        local LeaderAFK = parent:CreateAngle("Frame", nil, anchor)
        LeaderAFK:SetSize(width, height)
        LeaderAFK:SetPoint(point, CombatRest, relPoint, x, 0)
        LeaderAFK:SetAngleVertex(leftVertex, rightVertex)
        LeaderAFK.Override = UpdateStatus
        parent.Leader = LeaderAFK
        parent.AFK = LeaderAFK
    end
end

local CreateEndBox do
    local function UpdateEndBox(self, ...)
        local unit, color = self.unit
        local _, class = _G.UnitClass(unit)
        if _G.UnitIsPlayer(unit) then
            color = self.colors.class[class] --RealUI:GetClassColor(class)
        else
            if ( not _G.UnitPlayerControlled(unit) and _G.UnitIsTapDenied(unit) ) then
                color = self.colors.tapped
            else
                color = self.colors.reaction[_G.UnitReaction(unit, "player")]
            end
        end
        for i = 1, #self.EndBox do
            self.EndBox[i]:SetBackgroundColor(color[1], color[2], color[3], 1)
        end
    end
    function CreateEndBox(parent, unit, data)
        local height = parent.Health:GetHeight()
        local boxHeight = height + (data.isBig and 2 or 0)
        local boxWidth = data.isBig and 6 or 4
        local point, relPoint, x
        if data.health.point == "RIGHT" then
            point, relPoint, x = "TOPLEFT", "TOPRIGHT", -(height - 2)
        else
            point, relPoint, x = "TOPRIGHT", "TOPLEFT", (height - 2)
        end
        parent.EndBox = {
            Update = UpdateEndBox
        }

        local healthBox = parent:CreateAngle("Frame", nil, parent.Health)
        healthBox:SetSize(boxWidth, boxHeight)
        healthBox:SetPoint(point, parent.Health, relPoint, x, 0)
        healthBox:SetAngleVertex(GetVertices(data.health))
        parent.EndBox[1] = healthBox

        if data.isBig then
            height = parent.Power:GetHeight()
            boxHeight = height + 2
            boxWidth = data.isBig and 6 or 4
            if data.power.point == "RIGHT" then
                point, relPoint, x = "BOTTOMLEFT", "BOTTOMRIGHT", -(height - 2)
            else
                point, relPoint, x = "BOTTOMRIGHT", "BOTTOMLEFT", (height - 2)
            end
            local powerBox = parent:CreateAngle("Frame", nil, parent.Power)
            powerBox:SetSize(boxWidth, boxHeight)
            powerBox:SetPoint(point, parent.Power, relPoint, x, 0)
            powerBox:SetAngleVertex(GetVertices(data.power))
            parent.EndBox[2] = powerBox

            -- hide the line between the two boxes
            healthBox.bottom:Hide()
            powerBox.top:Hide()
        end
    end
end

-- Init
local function Shared(self, unit)
    UnitFrames:debug("Shared", self, self.unit, unit)

    self:SetScript("OnEnter", _G.UnitFrame_OnEnter)
    self:SetScript("OnLeave", _G.UnitFrame_OnLeave)
    self:RegisterForClicks("AnyUp")

    if db.misc.focusclick then
        local ModKey = db.misc.focuskey
        local MouseButton = 1
        local key = ModKey .. "-type" .. (MouseButton or "")
        if(self.unit == "focus") then
            self:SetAttribute(key, "macro")
            self:SetAttribute("macrotext", "/clearfocus")
        else
            self:SetAttribute(key, "focus")
        end
    end

    -- Create a proxy frame for the CombatFader to avoid taint city.
    self.overlay = _G.CreateFrame("Frame", nil, self)
    self.overlay:SetFrameStrata("BACKGROUND")
    CombatFader:RegisterFrameForFade("UnitFrames", self.overlay)

    local unitData = UnitFrames[unit]
    local unitDB = db.units[unit]
    self:SetSize(unitDB.size.x, unitDB.size.y)
    CreateHealthBar(self, unit, unitData.health)
    CreateHealthStatus(self, unit, unitData.health)
    if unitData.isBig then
        CreateHealthPredictBar(self, unit, unitData.health)
        CreatePowerBar(self, unit, unitData.power)
    end
    CreatePowerStatus(self, unit, unitData)
    CreateEndBox(self, unit, unitData)

    unitData.create(self)

    if unitData.hasCastBars and RealUI:GetModuleEnabled("CastBars") then
        RealUI:GetModule("CastBars"):CreateCastBars(self, unit, unitData)
    end


    function self.PreUpdate(frame, event)
        frame.Health:SetSmooth(false)
        if frame.Power then
            frame.Power:SetSmooth(false)
        end
        if unitData.PreUpdate then
            unitData.PreUpdate(frame, event)
        end
    end

    function self.PostUpdate(frame, event)
        frame.Health:SetSmooth(true)
        frame.Health:PositionSteps(unitData.issmall and "BOTTOM" or "TOP")
        if frame.Power then
            frame.Power:SetSmooth(true)
            frame.Power:PositionSteps("BOTTOM")
        end
        if frame.Classification then
            frame.Classification.Update(frame, event)
        end
        frame.EndBox.Update(frame, event)
        if unitData.PostUpdate then
            unitData.PostUpdate(frame, event)
        end
    end
end

function UnitFrames:InitializeLayout()
    db = UnitFrames.db.profile
    ndb = RealUI.db.profile

    oUF:RegisterStyle("RealUI", Shared)
    oUF:SetActiveStyle("RealUI")

    for i = 1, #UnitFrames.units do
        UnitFrames.units[i]()
    end
end

