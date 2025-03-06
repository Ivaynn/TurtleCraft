# Admin function - executed by player directly at any time

scoreboard players add paused turtlecraft.options 1
execute unless score paused turtlecraft.options matches 0..1 run scoreboard players set paused turtlecraft.options 0

execute if score paused turtlecraft.options matches 0 run tellraw @s ["",{"text":"TurtleCraft > ","color":"dark_aqua"},{"text":"Option \"paused\" set to 0","color":"gray"}]
execute if score paused turtlecraft.options matches 1 run tellraw @s ["",{"text":"TurtleCraft > ","color":"dark_aqua"},{"text":"Option \"paused\" set to 1","color":"gray"}]

