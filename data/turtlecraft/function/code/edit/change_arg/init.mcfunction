# Executed by the player. All turtle components have tag "turtlecraft.tmp"


## Get data
data modify storage turtlecraft:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions


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
execute if score $command turtlecraft.tmp matches 1 run function turtlecraft:code/edit/change_arg/move
execute if score $command turtlecraft.tmp matches 2 run function turtlecraft:code/edit/change_arg/turn
execute if score $command turtlecraft.tmp matches 3..4 run function turtlecraft:code/edit/change_arg/lime_group
execute if score $command turtlecraft.tmp matches 5..7 run function turtlecraft:code/edit/change_arg/yellow_group
execute if score $command turtlecraft.tmp matches 8..9 run function turtlecraft:code/edit/change_arg/orange_group
execute if score $command turtlecraft.tmp matches 10 run function turtlecraft:code/edit/change_arg/lime_group

execute if score $command turtlecraft.tmp matches 90 run function turtlecraft:code/edit/change_arg/comment
execute if score $command turtlecraft.tmp matches 91 run function turtlecraft:code/edit/change_arg/counter
execute if score $command turtlecraft.tmp matches 92..93 run function turtlecraft:code/edit/change_arg/if
execute if score $command turtlecraft.tmp matches 94 run function turtlecraft:code/edit/change_arg/fuel
execute if score $command turtlecraft.tmp matches 95 run function turtlecraft:code/edit/change_arg/line



## Save changes
# Merge: Instructions = list_start (last value changed) + list_end
data modify storage turtlecraft:tmp Instructions set from storage turtlecraft:tmp list_start
execute store result score $append_count turtlecraft.tmp run data get storage turtlecraft:tmp list_end
function turtlecraft:code/edit/common/append_list

 
# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp Instructions


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
data remove storage turtlecraft:tmp book
