
scoreboard players add limit_counter_display turtlecraft.options 1
execute unless score limit_counter_display turtlecraft.options matches 0..1 run scoreboard players set limit_counter_display turtlecraft.options 0
function turtlecraft:options/pages/p2
