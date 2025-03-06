# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Create temporary storage with the current instructions + get line count
data modify storage turtlecraft:tmp Instructions set from storage turtlecraft:tmp item_tag.Instructions
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

