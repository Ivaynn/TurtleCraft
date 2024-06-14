# Executed by the player. All turtle components have tag "tc.tmp"


# Create temporary storage with the current instructions + get line count
data modify storage tc:tmp Instructions set from storage tc:tmp item_tag.Instructions
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

