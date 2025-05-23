# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Get target indexes
scoreboard players operation $last_index turtlecraft.tmp = $line_count turtlecraft.tmp
scoreboard players operation $index turtlecraft.tmp = @s turtlecraft.line


# Make a new list with all values from 0 to $index
data modify storage turtlecraft:tmp list_start set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp < $last_index turtlecraft.tmp run function turtlecraft:code/edit/common/remove_last


# Make a new list with all values from $index (excluded) to end
data modify storage turtlecraft:tmp list_end set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp matches 0.. run function turtlecraft:code/edit/common/remove_first


# Merge: Instructions = list_start + new_line + list_end
data modify storage turtlecraft:tmp Instructions set from storage turtlecraft:tmp list_start
data modify storage turtlecraft:tmp Instructions append from storage turtlecraft:tmp new_line

execute store result score $append_count turtlecraft.tmp run data get storage turtlecraft:tmp list_end
function turtlecraft:code/edit/common/append_list


# Clear tmp
scoreboard players reset $index turtlecraft.tmp
scoreboard players reset $last_index turtlecraft.tmp
scoreboard players reset $append_count turtlecraft.tmp
data remove storage turtlecraft:tmp list_start
data remove storage turtlecraft:tmp list_end

