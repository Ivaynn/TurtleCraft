# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Create temporary storage with the new line
data modify storage turtlecraft:tmp new_line set value {C:0, A:{}}
execute if score $argument turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp new_line set value {C:1, A:{direction:"forward"}}
execute if score $argument turtlecraft.tmp matches 2 run data modify storage turtlecraft:tmp new_line set value {C:2, A:{direction:"left"}}
execute if score $argument turtlecraft.tmp matches 3 run data modify storage turtlecraft:tmp new_line set value {C:3, A:{direction:"forward"}}
execute if score $argument turtlecraft.tmp matches 4 run data modify storage turtlecraft:tmp new_line set value {C:4, A:{type:"all", direction:"forward"}}
execute if score $argument turtlecraft.tmp matches 5 run data modify storage turtlecraft:tmp new_line set value {C:5, A:{item:"tool", direction:"forward"}}
execute if score $argument turtlecraft.tmp matches 6 run data modify storage turtlecraft:tmp new_line set value {C:6, A:{item:"all", direction:"forward"}}
execute if score $argument turtlecraft.tmp matches 7 run data modify storage turtlecraft:tmp new_line set value {C:7, A:{item:"all", direction:"forward"}}
execute if score $argument turtlecraft.tmp matches 8 run data modify storage turtlecraft:tmp new_line set value {C:8, A:{item:"all"}}
execute if score $argument turtlecraft.tmp matches 9 run data modify storage turtlecraft:tmp new_line set value {C:9, A:{item:"all"}}
execute if score $argument turtlecraft.tmp matches 10 run data modify storage turtlecraft:tmp new_line set value {C:10, A:{direction:"forward"}}

execute if score $argument turtlecraft.tmp matches 90 run data modify storage turtlecraft:tmp new_line set value {C:90, A:{comment:""}}
execute if score $argument turtlecraft.tmp matches 91 run data modify storage turtlecraft:tmp new_line set value {C:91, A:{name:"name", operation: "=", type:"value", value:0}}
execute if score $argument turtlecraft.tmp matches 92 run data modify storage turtlecraft:tmp new_line set value {C:92, A:{condition:"item", item:"all"}}
execute if score $argument turtlecraft.tmp matches 93 run data modify storage turtlecraft:tmp new_line set value {C:93, A:{condition:"item", item:"all"}}
execute if score $argument turtlecraft.tmp matches 94 run data modify storage turtlecraft:tmp new_line set value {C:94, A:{item:"any", count:1}}
execute if score $argument turtlecraft.tmp matches 95 run data modify storage turtlecraft:tmp new_line set value {C:95, A:{operation:"set", line:1}}
execute if score $argument turtlecraft.tmp matches 96 run data modify storage turtlecraft:tmp new_line set value {C:96}
execute if score $argument turtlecraft.tmp matches 97 run data modify storage turtlecraft:tmp new_line set value {C:97}
execute if score $argument turtlecraft.tmp matches 98 run data modify storage turtlecraft:tmp new_line set value {C:98}
execute if score $argument turtlecraft.tmp matches 99 run data modify storage turtlecraft:tmp new_line set value {C:99}


# Create temporary storage with the current instructions + get line count
data modify storage turtlecraft:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions
execute store result score $line_count turtlecraft.tmp run data get storage turtlecraft:tmp Instructions
scoreboard players remove $line_count turtlecraft.tmp 1


# Make sure the player's selected line is valid for this turtle. If it's invalid -> select last line
execute unless score @s turtlecraft.line matches 0.. run scoreboard players operation @s turtlecraft.line = $line_count turtlecraft.tmp
execute if score @s turtlecraft.line > $line_count turtlecraft.tmp run scoreboard players operation @s turtlecraft.line = $line_count turtlecraft.tmp


# If last line is selected, append new line
execute if score @s turtlecraft.line = $line_count turtlecraft.tmp run data modify storage turtlecraft:tmp Instructions append from storage turtlecraft:tmp new_line


# If another line is selected, insert below selected line
execute if score @s turtlecraft.line < $line_count turtlecraft.tmp run function turtlecraft:code/edit/insert


# Select the new line
execute if score $line_count turtlecraft.tmp < max_length turtlecraft.options run scoreboard players add @s turtlecraft.line 1


# Save instructions to entity
execute if score $line_count turtlecraft.tmp < max_length turtlecraft.options run data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp Instructions


# Clear tmp
scoreboard players reset $line_count turtlecraft.tmp

data remove storage turtlecraft:tmp Instructions
data remove storage turtlecraft:tmp new_line
