# Executed by the player. All turtle components have tag "tc.tmp"


## Get data
data modify storage tc:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions


# Get target indexes
execute store result score $line_count tc.tmp run data get storage tc:tmp Instructions
scoreboard players remove $line_count tc.tmp 1
scoreboard players operation $last_index tc.tmp = $line_count tc.tmp
scoreboard players operation $index tc.tmp = @s tc.line


# Make a new list with all values from 0 to $index
data modify storage tc:tmp list_start set from storage tc:tmp Instructions
execute if score $index tc.tmp < $last_index tc.tmp run function tc:code/edit/common/remove_last


# Make a new list with all values from $index (excluded) to end
data modify storage tc:tmp list_end set from storage tc:tmp Instructions
execute if score $index tc.tmp matches 0.. run function tc:code/edit/common/remove_first


# Last value of first list is $index == selected line
execute store result score $command tc.tmp run data get storage tc:tmp list_start[-1].C
data modify storage tc:tmp edit_arg set from storage tc:tmp list_start[-1].A



## Update arguments
scoreboard players set $toggle_breakpoint tc.tmp 0
execute store result score $toggle_breakpoint tc.tmp run data get storage tc:tmp list_start[-1].bp
execute if score $toggle_breakpoint tc.tmp matches 0 run data modify storage tc:tmp list_start[-1].bp set value 1b
execute if score $toggle_breakpoint tc.tmp matches 1 run data remove storage tc:tmp list_start[-1].bp



## Save changes
# Merge: Instructions = list_start (last value changed) + list_end
data modify storage tc:tmp Instructions set from storage tc:tmp list_start
execute store result score $append_count tc.tmp run data get storage tc:tmp list_end
function tc:code/edit/common/append_list

 
# Save instructions to entity
data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions set from storage tc:tmp Instructions


# Clear tmp
scoreboard players reset $index tc.tmp
scoreboard players reset $last_index tc.tmp
scoreboard players reset $line_count tc.tmp
scoreboard players reset $append_count tc.tmp
scoreboard players reset $command tc.tmp

data remove storage tc:tmp list_start
data remove storage tc:tmp list_end
data remove storage tc:tmp Instructions
data remove storage tc:tmp edit_arg

scoreboard players reset $toggle_breakpoint tc.tmp
