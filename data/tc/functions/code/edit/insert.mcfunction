# Executed by the player. All turtle components have tag "tc.tmp"


# Get target indexes
scoreboard players operation $last_index tc.tmp = $line_count tc.tmp
scoreboard players operation $index tc.tmp = @s tc.line


# Make a new list with all values from 0 to $index
data modify storage tc:tmp list_start set from storage tc:tmp Instructions
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last


# Make a new list with all values from $index (excluded) to end
data modify storage tc:tmp list_end set from storage tc:tmp Instructions
execute if score $index tc.tmp matches 0.. run function tc:code/edit/common/remove_first


# Merge: Instructions = list_start + new_line + list_end
data modify storage tc:tmp Instructions set from storage tc:tmp list_start
data modify storage tc:tmp Instructions append from storage tc:tmp new_line

execute store result score $append_count tc.tmp run data get storage tc:tmp list_end
function tc:code/edit/common/append_list


# Update "line set" instructions
scoreboard players set $line_set_diff tc.tmp 1
function tc:code/edit/update_line_set/init


# Clear tmp
scoreboard players reset $index tc.tmp
scoreboard players reset $last_index tc.tmp
scoreboard players reset $append_count tc.tmp
data remove storage tc:tmp list_start
data remove storage tc:tmp list_end

