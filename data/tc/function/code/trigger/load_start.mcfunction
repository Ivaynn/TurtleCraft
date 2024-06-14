# Function triggered by a player


# Save item to storage
data modify storage tc:tmp item set from entity @s SelectedItem
data remove storage tc:tmp item.components."minecraft:custom_data".tc.Instructions


# Get instructions from import
function tc:import

execute unless data storage tc:tmp item.components."minecraft:custom_data".tc.Instructions run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"Instructions not found!\n","color":"gray"}]
execute if data storage tc:tmp item.components."minecraft:custom_data".tc.Instructions run function tc:code/trigger/load_success


# Clear tmp
data remove storage tc:tmp item
