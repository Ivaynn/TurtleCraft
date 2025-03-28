# Executed by server every tick

# As every turtle running
scoreboard players set $action_count turtlecraft.tmp 0
execute as @e[type=minecraft:llama,tag=turtlecraft.body,scores={turtlecraft.line=1.., turtlecraft.timer=0..},sort=random] at @s run function turtlecraft:code/run/timer
execute if score show_warnings turtlecraft.options matches 1 if score $action_count turtlecraft.tmp >= max_actions_tick turtlecraft.options run tellraw @a ["",{"text":"WARNING: ","color":"gold"},{"text":"Maximum actions per tick reached!","color":"gray","hover_event":{action:"show_text",value:[{"text":"Turtles are now slower to keep actions\nbelow the limit and reduce lag","color":"gray"}]}}]
scoreboard players reset $action_count turtlecraft.tmp
