# Admin function - executed by player directly at any time


# Not holding a valid item
execute as @s[predicate=!tc:holding_disc_turtle,predicate=!tc:holding_turtle_egg] run return run tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"You must be holding a Turtle Egg or a Turtle Disc to use this command!\n","color":"gray"}]


# Turtle egg with no data
execute as @s[predicate=tc:holding_turtle_egg] unless data entity @s SelectedItem.components."minecraft:entity_data".data run return run tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"This is egg has no data!\n","color":"gray"}]


# Get datapack version
scoreboard players set $dp_version tc.tmp 1
execute as @s[predicate=tc:holding_disc_turtle] store result score $dp_version tc.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".tc.Instructions[0].Version
execute as @s[predicate=tc:holding_turtle_egg] store result score $dp_version tc.tmp run data get entity @s SelectedItem.components."minecraft:entity_data".data.tc.Instructions[0].Version


# Current version
execute if score $dp_version tc.tmp matches 2 run return run tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"This item is from the current version of the data pack!\n","color":"gray"}]


# Old version
tellraw @s ["",{"text":"\nTurtleCraft > ","color":"dark_aqua"},{"text":"This item is from an old version of the data pack!\n","color":"gray"}]
