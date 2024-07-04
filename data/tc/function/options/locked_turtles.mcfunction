
scoreboard players add locked_turtles tc.options 1
execute unless score locked_turtles tc.options matches 0..1 run scoreboard players set locked_turtles tc.options 0
function tc:options/pages/p2
