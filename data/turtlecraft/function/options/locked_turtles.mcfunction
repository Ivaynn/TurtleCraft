
scoreboard players add locked_turtles turtlecraft.options 1
execute unless score locked_turtles turtlecraft.options matches 0..1 run scoreboard players set locked_turtles turtlecraft.options 0
function turtlecraft:options/pages/p2
