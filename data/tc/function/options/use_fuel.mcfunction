
scoreboard players add use_fuel tc.options 1
execute unless score use_fuel tc.options matches 0..1 run scoreboard players set use_fuel tc.options 0
function tc:options/pages/p2
