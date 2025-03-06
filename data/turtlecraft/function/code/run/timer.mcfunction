# Executed by every running turtlecraft.body every tick, if action limit wasn't reached

scoreboard players add @s turtlecraft.timer 1
execute if score @s turtlecraft.fuel matches 1.. run scoreboard players operation $threshold turtlecraft.tmp = delay_fueled turtlecraft.options
execute if score @s turtlecraft.fuel matches 1.. if score use_fuel turtlecraft.options matches 1 run scoreboard players operation $threshold turtlecraft.tmp = delay_fueled turtlecraft.options
execute if score @s turtlecraft.fuel matches 1.. unless score use_fuel turtlecraft.options matches 1 run scoreboard players operation $threshold turtlecraft.tmp = delay_normal turtlecraft.options
execute unless score @s turtlecraft.fuel matches 1.. run scoreboard players operation $threshold turtlecraft.tmp = delay_normal turtlecraft.options
execute if score $action_count turtlecraft.tmp < max_actions_tick turtlecraft.options if score @s turtlecraft.timer >= $threshold turtlecraft.tmp run function turtlecraft:code/run/tag_and_run
execute if score $action_count turtlecraft.tmp >= max_actions_tick turtlecraft.options run scoreboard players remove @s[scores={turtlecraft.timer=1..}] turtlecraft.timer 1
scoreboard players reset $threshold turtlecraft.tmp