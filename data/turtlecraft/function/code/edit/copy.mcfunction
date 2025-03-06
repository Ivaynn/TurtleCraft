# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Get data
data modify storage turtlecraft:tmp Instructions set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions
execute store result score $last_index turtlecraft.tmp run data get storage turtlecraft:tmp Instructions
scoreboard players remove $last_index turtlecraft.tmp 1

execute if score $last_index turtlecraft.tmp matches 1.. run function turtlecraft:code/edit/copy_sucess


# Clear tmp
data remove storage turtlecraft:tmp Instructions
scoreboard players reset $last_index turtlecraft.tmp
