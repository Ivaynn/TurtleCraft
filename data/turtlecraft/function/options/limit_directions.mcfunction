
scoreboard players add limit_directions turtlecraft.options 1
execute unless score limit_directions turtlecraft.options matches 0..1 run scoreboard players set limit_directions turtlecraft.options 0
function turtlecraft:options/pages/p2
