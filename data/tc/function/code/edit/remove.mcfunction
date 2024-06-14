# Executed by the player. All turtle components have tag "tc.tmp"


# Create temporary storage with the current instructions + get line count
data modify storage tc:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions
execute store result score $line_count tc.tmp run data get storage tc:tmp Instructions
scoreboard players remove $line_count tc.tmp 1


# If last line is selected, use easy remove
execute if score @s tc.line matches 1.. if score @s tc.line = $line_count tc.tmp run data remove storage tc:tmp Instructions[-1]


# If another line is selected, use complex remove
execute if score @s tc.line < $line_count tc.tmp run function tc:code/edit/remove_selected


# Make sure the player's selected line is valid for this turtle. If it's invalid -> select first line
execute if score $line_count tc.tmp matches 1.. run scoreboard players remove $line_count tc.tmp 1
execute if score @s tc.line matches 2.. run scoreboard players remove @s tc.line 1
execute unless score @s tc.line matches 0.. run scoreboard players set @s tc.line 1
execute if score @s tc.line > $line_count tc.tmp run scoreboard players set @s tc.line 1


# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions set from storage tc:tmp Instructions


# Clear tmp
scoreboard players reset $line_count tc.tmp
