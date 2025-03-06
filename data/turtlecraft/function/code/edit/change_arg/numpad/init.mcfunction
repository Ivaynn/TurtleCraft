# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Make $argument go from 0 to 9 - Special cases: backspace (89) and invert (88)
execute if score $argument turtlecraft.tmp matches 90..99 run scoreboard players operation $argument turtlecraft.tmp %= #10 turtlecraft.math


## Get data
data modify storage turtlecraft:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions


# Get target indexes
execute store result score $line_count turtlecraft.tmp run data get storage turtlecraft:tmp Instructions
scoreboard players remove $line_count turtlecraft.tmp 1
scoreboard players operation $last_index turtlecraft.tmp = $line_count turtlecraft.tmp
scoreboard players operation $index turtlecraft.tmp = @s turtlecraft.line


# Make a new list with all values from 0 to $index
data modify storage turtlecraft:tmp list_start set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp < $last_index turtlecraft.tmp run function turtlecraft:code/edit/common/remove_last


# Make a new list with all values from $index (excluded) to end
data modify storage turtlecraft:tmp list_end set from storage turtlecraft:tmp Instructions
execute if score $index turtlecraft.tmp matches 0.. run function turtlecraft:code/edit/common/remove_first


# Last value of first list is $index == selected line
execute store result score $command turtlecraft.tmp run data get storage turtlecraft:tmp list_start[-1].C
data modify storage turtlecraft:tmp edit_arg set from storage turtlecraft:tmp list_start[-1].A


## Update arguments
execute if score $command turtlecraft.tmp matches 91 run function turtlecraft:code/edit/change_arg/numpad/counter
execute if score $command turtlecraft.tmp matches 92..93 run function turtlecraft:code/edit/change_arg/numpad/if
execute if score $command turtlecraft.tmp matches 94 run function turtlecraft:code/edit/change_arg/numpad/fuel
execute if score $command turtlecraft.tmp matches 95 run function turtlecraft:code/edit/change_arg/numpad/line


## Save changes
# Merge: Instructions = list_start (last value changed) + list_end
data modify storage turtlecraft:tmp Instructions set from storage turtlecraft:tmp list_start
execute store result score $append_count turtlecraft.tmp run data get storage turtlecraft:tmp list_end
function turtlecraft:code/edit/common/append_list

 
# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp Instructions


# Clear tmp
scoreboard players reset $index turtlecraft.tmp
scoreboard players reset $last_index turtlecraft.tmp
scoreboard players reset $line_count turtlecraft.tmp
scoreboard players reset $append_count turtlecraft.tmp
scoreboard players reset $command turtlecraft.tmp

data remove storage turtlecraft:tmp list_start
data remove storage turtlecraft:tmp list_end
data remove storage turtlecraft:tmp Instructions
data remove storage turtlecraft:tmp edit_arg

scoreboard players reset $return turtlecraft.tmp
scoreboard players reset $negative turtlecraft.tmp
scoreboard players reset $new_value turtlecraft.tmp
scoreboard players reset $test_value turtlecraft.tmp
scoreboard players reset $original_value turtlecraft.tmp
