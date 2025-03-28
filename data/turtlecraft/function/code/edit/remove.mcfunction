# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Create temporary storage with the current instructions + get line count
data modify storage turtlecraft:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions
execute store result score $line_count turtlecraft.tmp run data get storage turtlecraft:tmp Instructions
scoreboard players remove $line_count turtlecraft.tmp 1


# If last line is selected, use easy remove
execute if score @s turtlecraft.line matches 1.. if score @s turtlecraft.line = $line_count turtlecraft.tmp run data remove storage turtlecraft:tmp Instructions[-1]


# If another line is selected, use complex remove
execute if score @s turtlecraft.line < $line_count turtlecraft.tmp run function turtlecraft:code/edit/remove_selected


# Make sure the player's selected line is valid for this turtle. If it's invalid -> select first line
execute if score $line_count turtlecraft.tmp matches 1.. run scoreboard players remove $line_count turtlecraft.tmp 1
execute if score @s turtlecraft.line matches 2.. run scoreboard players remove @s turtlecraft.line 1
execute unless score @s turtlecraft.line matches 0.. run scoreboard players set @s turtlecraft.line 1
execute if score @s turtlecraft.line > $line_count turtlecraft.tmp run scoreboard players set @s turtlecraft.line 1


# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp Instructions


# Clear tmp
scoreboard players reset $line_count turtlecraft.tmp
