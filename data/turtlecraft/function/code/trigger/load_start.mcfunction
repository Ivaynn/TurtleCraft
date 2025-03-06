# Function triggered by a player


# Save item to storage
data modify storage turtlecraft:tmp item set from entity @s SelectedItem
data remove storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.Instructions
data remove storage turtlecraft:tmp import


# Get instructions from import
function turtlecraft:import
data modify storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp import

execute unless data storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.Instructions run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"Instructions not found!\n","color":"gray"}]
execute if data storage turtlecraft:tmp item.components."minecraft:custom_data".turtlecraft.Instructions run function turtlecraft:code/trigger/load_success


# Clear tmp
data remove storage turtlecraft:tmp item
data remove storage turtlecraft:tmp import
