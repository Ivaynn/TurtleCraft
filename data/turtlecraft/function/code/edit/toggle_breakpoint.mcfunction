# Executed by the player. All turtle components have tag "turtlecraft.tmp"


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
scoreboard players set $toggle_breakpoint turtlecraft.tmp 0
execute store result score $toggle_breakpoint turtlecraft.tmp run data get storage turtlecraft:tmp list_start[-1].bp
execute if score $toggle_breakpoint turtlecraft.tmp matches 0 run data modify storage turtlecraft:tmp list_start[-1].bp set value 1b
execute if score $toggle_breakpoint turtlecraft.tmp matches 1 run data remove storage turtlecraft:tmp list_start[-1].bp



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

scoreboard players reset $toggle_breakpoint turtlecraft.tmp
