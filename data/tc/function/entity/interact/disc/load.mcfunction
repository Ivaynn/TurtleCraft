# Executed by player - all turtle entities have "tc.tmp"

advancement grant @s only tc:save_to_disc


# Stop turtle
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/stop


# Copy disc data to turtle
data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions set from entity @s SelectedItem.components."minecraft:custom_data".tc.Instructions
