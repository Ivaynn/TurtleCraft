# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# If counter name isn't json, convert it
data modify storage turtlecraft:tmp json_arg.check set value "{"
data modify storage turtlecraft:tmp json_arg.copy set string storage turtlecraft:tmp Counters[-1].name 0 1
execute store success score $convert_str turtlecraft.tmp run data modify storage turtlecraft:tmp json_arg.copy set string storage turtlecraft:tmp json_arg.check
execute if score $convert_str turtlecraft.tmp matches 1 run data modify entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text set value {"nbt":"Counters[-1].name","storage":"turtlecraft:tmp"}
execute if score $convert_str turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp Counters[-1].name set from entity @e[limit=1,type=minecraft:text_display,tag=turtlecraft.tmp,tag=turtlecraft.text] text


# Print line
tellraw @s [{"text":" ","hover_event":{action:"show_text",value:[{"nbt":"Counters[-1].name","interpret":false,"storage":"turtlecraft:tmp","color":"gray"}]}},{"nbt":"Counters[-1].name","interpret":true,"storage":"turtlecraft:tmp","color":"gray"},{"text":":  ","color":"gray"},{"nbt":"Counters[-1].value","storage":"turtlecraft:tmp","color":"gray"}]


# Iterate
data remove storage turtlecraft:tmp Counters[-1]
scoreboard players remove $counter_index turtlecraft.tmp 1
execute if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/display/pages/counter_list
