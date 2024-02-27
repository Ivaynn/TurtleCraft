# Executed by the player. All turtle components have tag "tc.tmp"


# If counter name isn't json, convert it
data modify storage tc:tmp json_arg.check set value "{"
data modify storage tc:tmp json_arg.copy set string storage tc:tmp Counters[-1].name 0 1
execute store success score $convert_str tc.tmp run data modify storage tc:tmp json_arg.copy set string storage tc:tmp json_arg.check
execute if score $convert_str tc.tmp matches 1 run data modify entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] text set value '{"nbt":"Counters[-1].name","storage":"tc:tmp"}'
execute if score $convert_str tc.tmp matches 1 run data modify storage tc:tmp Counters[-1].name set from entity @e[limit=1,type=minecraft:text_display,tag=tc.tmp,tag=tc.text] text


# Print line
tellraw @s [" ",{"nbt":"Counters[-1].name","interpret":true,"storage":"tc:tmp","color":"gray","hoverEvent":{"action":"show_text","contents":[{"nbt":"Counters[-1].name","interpret":false,"storage":"tc:tmp","color":"gray"}]}},{"text":":  ","color":"gray"},{"nbt":"Counters[-1].value","storage":"tc:tmp","color":"gray"}]


# Iterate
data remove storage tc:tmp Counters[-1]
scoreboard players remove $counter_index tc.tmp 1
execute if score $counter_index tc.tmp matches 1.. run function tc:code/edit/display/pages/counter_list
