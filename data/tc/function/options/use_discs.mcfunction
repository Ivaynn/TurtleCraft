
scoreboard players add use_discs tc.options 1
execute unless score use_discs tc.options matches 0..1 run scoreboard players set use_discs tc.options 0
function tc:options/pages/p2
