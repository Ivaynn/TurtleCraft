# Executed by every running tc.body every tick, if action limit wasn't reached

scoreboard players add @s tc.timer 1
execute if score @s tc.fuel matches 1.. run scoreboard players operation $threshold tc.tmp = delay_fueled tc.options
execute if score @s tc.fuel matches 1.. if score use_fuel tc.options matches 1 run scoreboard players operation $threshold tc.tmp = delay_fueled tc.options
execute if score @s tc.fuel matches 1.. unless score use_fuel tc.options matches 1 run scoreboard players operation $threshold tc.tmp = delay_normal tc.options
execute unless score @s tc.fuel matches 1.. run scoreboard players operation $threshold tc.tmp = delay_normal tc.options
execute if score $action_count tc.tmp < max_actions_tick tc.options if score @s tc.timer >= $threshold tc.tmp run function tc:code/run/tag_and_run
execute if score $action_count tc.tmp >= max_actions_tick tc.options run scoreboard players remove @s[scores={tc.timer=1..}] tc.timer 1
scoreboard players reset $threshold tc.tmp