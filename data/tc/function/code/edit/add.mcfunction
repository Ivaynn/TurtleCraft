# Executed by the player. All turtle components have tag "tc.tmp"


# Create temporary storage with the new line
data modify storage tc:tmp new_line set value {C:0, A:{}}
execute if score $argument tc.tmp matches 1 run data modify storage tc:tmp new_line set value {C:1, A:{direction:"forward"}}
execute if score $argument tc.tmp matches 2 run data modify storage tc:tmp new_line set value {C:2, A:{direction:"left"}}
execute if score $argument tc.tmp matches 3 run data modify storage tc:tmp new_line set value {C:3, A:{direction:"forward"}}
execute if score $argument tc.tmp matches 4 run data modify storage tc:tmp new_line set value {C:4, A:{type:"all", direction:"forward"}}
execute if score $argument tc.tmp matches 5 run data modify storage tc:tmp new_line set value {C:5, A:{item:"tool", direction:"forward"}}
execute if score $argument tc.tmp matches 6 run data modify storage tc:tmp new_line set value {C:6, A:{item:"all", direction:"forward"}}
execute if score $argument tc.tmp matches 7 run data modify storage tc:tmp new_line set value {C:7, A:{item:"all", direction:"forward"}}
execute if score $argument tc.tmp matches 8 run data modify storage tc:tmp new_line set value {C:8, A:{item:"all"}}
execute if score $argument tc.tmp matches 9 run data modify storage tc:tmp new_line set value {C:9, A:{item:"all"}}
execute if score $argument tc.tmp matches 10 run data modify storage tc:tmp new_line set value {C:10, A:{direction:"forward"}}

execute if score $argument tc.tmp matches 90 run data modify storage tc:tmp new_line set value {C:90}
execute if score $argument tc.tmp matches 91 run data modify storage tc:tmp new_line set value {C:91, A:{name:"name", operation: "=", type:"value", value:0}}
execute if score $argument tc.tmp matches 92 run data modify storage tc:tmp new_line set value {C:92, A:{condition:"item", item:"all"}}
execute if score $argument tc.tmp matches 93 run data modify storage tc:tmp new_line set value {C:93, A:{condition:"item", item:"all"}}
execute if score $argument tc.tmp matches 94 run data modify storage tc:tmp new_line set value {C:94, A:{item:"any", count:1}}
execute if score $argument tc.tmp matches 95 run data modify storage tc:tmp new_line set value {C:95, A:{operation:"set", line:1}}
execute if score $argument tc.tmp matches 96 run data modify storage tc:tmp new_line set value {C:96}
execute if score $argument tc.tmp matches 97 run data modify storage tc:tmp new_line set value {C:97}
execute if score $argument tc.tmp matches 98 run data modify storage tc:tmp new_line set value {C:98}
execute if score $argument tc.tmp matches 99 run data modify storage tc:tmp new_line set value {C:99}


# Create temporary storage with the current instructions + get line count
data modify storage tc:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions
execute store result score $line_count tc.tmp run data get storage tc:tmp Instructions
scoreboard players remove $line_count tc.tmp 1


# Make sure the player's selected line is valid for this turtle. If it's invalid -> select last line
execute unless score @s tc.line matches 0.. run scoreboard players operation @s tc.line = $line_count tc.tmp
execute if score @s tc.line > $line_count tc.tmp run scoreboard players operation @s tc.line = $line_count tc.tmp


# If last line is selected, append new line
execute if score @s tc.line = $line_count tc.tmp run data modify storage tc:tmp Instructions append from storage tc:tmp new_line


# If another line is selected, insert below selected line
execute if score @s tc.line < $line_count tc.tmp run function tc:code/edit/insert


# Select the new line
execute if score $line_count tc.tmp < max_length tc.options run scoreboard players add @s tc.line 1


# Save instructions to entity
execute if score $line_count tc.tmp < max_length tc.options run data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions set from storage tc:tmp Instructions


# Clear tmp
scoreboard players reset $line_count tc.tmp

data remove storage tc:tmp Instructions
data remove storage tc:tmp new_line
