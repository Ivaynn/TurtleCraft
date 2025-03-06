# Executed by player - all turtle entities have "turtlecraft.tmp"

advancement grant @s only turtlecraft:save_to_disc


# Stop turtle
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:code/stop


# Copy disc data to turtle
data modify entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions set from entity @s SelectedItem.components."minecraft:custom_data".turtlecraft.Instructions
