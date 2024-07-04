# Admin function - executed by player directly at any time


# Return: item is not disc
execute unless predicate tc:holding_disc run return run tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"You must be holding a Turtle Disc to use this!\n","color":"gray"}]


# Return: disc has no "tc" data (and no "Instructions" data - legacy)
execute unless data entity @s SelectedItem.components."minecraft:custom_data".tc unless data entity @s SelectedItem.components."minecraft:custom_data".Instructions run return run tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"You must be holding a Turtle Disc to use this!\n","color":"gray"}]


# Get version of the stored program (legacy had no version tag - defaults to 1)
scoreboard players set $dp_version tc.tmp 1
execute store result score $dp_version tc.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".tc.Instructions[0].Version


# Return: Already on latest version
execute if score $dp_version tc.tmp matches 2 run return run tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"This item is already on the latest version!\n","color":"gray"}]


# UPGRADE
tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"Your item was upgraded to the latest version!\n","color":"gray"}]
data modify storage tc:tmp upgrade_data set value {TurtleDisc:1b}


# v1 -> v2
execute unless score $dp_version tc.tmp matches 2.. run data modify storage tc:tmp upgrade_data.Instructions set from entity @s SelectedItem.components."minecraft:custom_data".Instructions
execute unless score $dp_version tc.tmp matches 2.. run data modify storage tc:tmp upgrade_data.Instructions[0].Version set value 2
execute unless score $dp_version tc.tmp matches 2.. run item modify entity @s weapon.mainhand tc:upgrade_disc_v1_2
