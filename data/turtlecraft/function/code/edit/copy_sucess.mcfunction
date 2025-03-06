# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Make a new list with all values from 0 to $index
scoreboard players operation $index turtlecraft.tmp = @s turtlecraft.line
data modify storage turtlecraft:tmp list_start set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp < $last_index turtlecraft.tmp run function turtlecraft:code/edit/common/remove_last


# Get current line
data modify storage turtlecraft:tmp Clipboard set from storage turtlecraft:tmp list_start[-1]


# Save to clipboard
data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Clipboard set from storage turtlecraft:tmp Clipboard


# Clear tmp
data remove storage turtlecraft:tmp list_start
data remove storage turtlecraft:tmp Clipboard
scoreboard players reset $index turtlecraft.tmp
