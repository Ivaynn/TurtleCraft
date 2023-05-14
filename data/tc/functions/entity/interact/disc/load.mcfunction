# Executed by player - all turtle entities have "tc.tmp"

advancement grant @s only tc:save_to_disc


# Stop turtle
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:code/stop


# Copy book data to turtle and display new instructions in chat
execute store success score $success tc.tmp run data modify entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Instructions set from entity @s SelectedItem.tag.Instructions


# If transfer fails, turtle already had those instructions -> reset disc
execute if score $success tc.tmp matches 0 run function tc:entity/interact/disc/reset_disc


# Display
execute if score $success tc.tmp matches 0 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Turtle already had these Instructions - Disc Cleared!\n","color":"gray"}]
execute if score $success tc.tmp matches 1 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Loaded Instructions and Options from Disc!\n","color":"gray"}]


# Clear tmp
scoreboard players reset $success tc.tmp
