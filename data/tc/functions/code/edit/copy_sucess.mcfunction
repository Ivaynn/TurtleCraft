# Executed by the player. All turtle components have tag "tc.tmp"


# Make a new list with all values from 0 to $index
scoreboard players operation $index tc.tmp = @s tc.line
data modify storage tc:tmp list_start set from storage tc:tmp Instructions
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last


# Get current line
data modify storage tc:tmp Clipboard set from storage tc:tmp list_start[-1]


# Save to clipboard
data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Clipboard set from storage tc:tmp Clipboard


# Clear tmp
data remove storage tc:tmp list_start
data remove storage tc:tmp Clipboard
scoreboard players reset $index tc.tmp
