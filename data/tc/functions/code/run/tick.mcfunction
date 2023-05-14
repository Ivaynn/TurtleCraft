# Executed by server every tick

# As every turtle running
scoreboard players set $action_count tc.tmp 0
execute as @e[type=minecraft:llama,tag=tc.body,scores={tc.line=1.., tc.timer=0..},sort=random] at @s run function tc:code/run/timer
execute if score show_warnings tc.options matches 1 if score $action_count tc.tmp >= max_actions_tick tc.options run tellraw @a ["",{"text":"WARNING: ","color":"gold"},{"text":"Maximum actions per tick reached!","color":"gray","hoverEvent":{"action":"show_text","contents":[{"text":"Turtles are now slower to keep actions\nbelow the limit and reduce lag","color":"gray"}]}}]
scoreboard players reset $action_count tc.tmp
