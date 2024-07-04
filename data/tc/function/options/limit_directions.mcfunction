
scoreboard players add limit_directions tc.options 1
execute unless score limit_directions tc.options matches 0..1 run scoreboard players set limit_directions tc.options 0
function tc:options/pages/p2
