# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Make a new list with all values from 0 to $index
scoreboard players operation $index turtlecraft.tmp = @s turtlecraft.line
data modify storage turtlecraft:tmp list_start set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp < $last_index turtlecraft.tmp run function turtlecraft:code/edit/common/remove_last


# Switch lines -1 and -2
data modify storage turtlecraft:tmp switch_line set from storage turtlecraft:tmp list_start[-2]
data modify storage turtlecraft:tmp list_start[-2] set from storage turtlecraft:tmp list_start[-1]
data modify storage turtlecraft:tmp list_start[-1] set from storage turtlecraft:tmp switch_line


# Make a new list with all values from $index (excluded) to end
data modify storage turtlecraft:tmp list_end set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp matches 0.. run function turtlecraft:code/edit/common/remove_first


# Merge lists
data modify storage turtlecraft:tmp Instructions set from storage turtlecraft:tmp list_start
execute store result score $append_count turtlecraft.tmp run data get storage turtlecraft:tmp list_end
function turtlecraft:code/edit/common/append_list


# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp Instructions


# Clear tmp
data remove storage turtlecraft:tmp list_start
data remove storage turtlecraft:tmp list_end
data remove storage turtlecraft:tmp switch_line
scoreboard players reset $index turtlecraft.tmp
scoreboard players reset $append_count turtlecraft.tmp
