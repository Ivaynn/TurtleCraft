# Executed by the player. All turtle components have tag "tc.tmp"


# Make a new list with all values from 0 to $index
scoreboard players operation $index tc.tmp = @s tc.line
data modify storage tc:tmp list_start set from storage tc:tmp Instructions
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last


# Switch lines -1 and -2
data modify storage tc:tmp switch_line set from storage tc:tmp list_start[-2]
data modify storage tc:tmp list_start[-2] set from storage tc:tmp list_start[-1]
data modify storage tc:tmp list_start[-1] set from storage tc:tmp switch_line


# Make a new list with all values from $index (excluded) to end
data modify storage tc:tmp list_end set from storage tc:tmp Instructions
execute if score $index tc.tmp matches 0.. run function tc:code/edit/common/remove_first


# Merge lists
data modify storage tc:tmp Instructions set from storage tc:tmp list_start
execute store result score $append_count tc.tmp run data get storage tc:tmp list_end
function tc:code/edit/common/append_list


# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Instructions set from storage tc:tmp Instructions


# Clear tmp
data remove storage tc:tmp list_start
data remove storage tc:tmp list_end
data remove storage tc:tmp switch_line
scoreboard players reset $index tc.tmp
scoreboard players reset $append_count tc.tmp
