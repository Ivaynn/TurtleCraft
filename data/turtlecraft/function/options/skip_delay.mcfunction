
scoreboard players add skip_purple_delay turtlecraft.options 1
execute unless score skip_purple_delay turtlecraft.options matches 0..1 run scoreboard players set skip_purple_delay turtlecraft.options 0
function turtlecraft:options/pages/p2
