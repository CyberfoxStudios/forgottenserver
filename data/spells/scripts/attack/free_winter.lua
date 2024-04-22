local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE3X3)) --can create custom in lib if needed

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	-- we will recast the spell every second
	-- for 3 seconds to match the longer video length
	local repeats = 6
	for counter = 1, repeats do
		addEvent(function () 
			combat:execute(creature, variant)
		end, counter * 500) -- 500 ms == 0.5s
	end
end