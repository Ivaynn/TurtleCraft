# Executed by the player. All turtle components have tag "tc.tmp"


# Get data
data modify storage tc:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions
execute store result score $last_index tc.tmp run data get storage tc:tmp Instructions
scoreboard players remove $last_index tc.tmp 1

execute if score $last_index tc.tmp matches 1.. run function tc:code/edit/copy_sucess


# Clear tmp
data remove storage tc:tmp Instructions
scoreboard players reset $last_index tc.tmp
