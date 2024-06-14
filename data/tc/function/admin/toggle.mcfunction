# Admin function - executed by player directly at any time

scoreboard players add paused tc.options 1
execute unless score paused tc.options matches 0..1 run scoreboard players set paused tc.options 0

execute if score paused tc.options matches 0 run tellraw @s ["",{"text":"TurtleCraft > ","color":"dark_aqua"},{"text":"Option \"paused\" set to 0","color":"gray"}]
execute if score paused tc.options matches 1 run tellraw @s ["",{"text":"TurtleCraft > ","color":"dark_aqua"},{"text":"Option \"paused\" set to 1","color":"gray"}]

