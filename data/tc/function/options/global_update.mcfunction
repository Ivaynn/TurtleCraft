
scoreboard players add global_update tc.options 1
execute unless score global_update tc.options matches 0..1 run scoreboard players set global_update tc.options 0
function tc:options/pages/p2
