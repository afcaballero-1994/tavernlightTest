--this is the simplest implementation to generate a similar enough effect,
--for a more randomized one, i would generate at least four random areas and use a loop, but at least this seems good enough
--did not add damage calculation because it was not entirely neccesary to do it

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)

local arr1 = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 0, 1, 1, 0, 0},
    {0, 0, 0, 0, 1, 1, 0, 0, 0},
    {1, 1, 1, 1, 2, 1, 1, 1, 1},
    {0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 1, 1, 1, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0}
}
local arr2 = {
    {1, 0, 0, 0, 1, 0, 0, 1, 1},
    {1, 0, 0, 0, 1, 0, 0, 1, 1},
    {0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, 0, 1, 1, 0, 1, 1, 0, 0},
    {0, 0, 0, 0, 2, 0, 0, 0, 0},
    {0, 0, 1, 1, 0, 1, 1, 0, 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0},
    {1, 0, 0, 0, 1, 0, 0, 0, 1},
    {1, 0, 0, 0, 1, 0, 0, 0, 1}
}


local area = createCombatArea(arr1)
combat:setArea(area)
local area2 = createCombatArea(arr2)
combat2:setArea(area2)

local function castExpell2(creature, variant)
    combat2:execute(creature, variant)
end
local function castExpell(creature, variant)
    combat:execute(creature, variant)
end

function onCastSpell(creature, variant, isHotkey)
--combined two similar spells to two different events so one start before the other
--this so when one animation ends the other starts
    addEvent(castExpell, 0, creature.uid, variant)
    addEvent(castExpell2, 500, creature.uid, variant)
	return true
end
