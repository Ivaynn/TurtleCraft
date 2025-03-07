# Executed by the server EVERY TICK


# Relog
execute as @a[scores={turtlecraft.relog=1..}] run function turtlecraft:reset_player


# Update every turtle every 5 seconds, spread according to its ID
execute if score global_update turtlecraft.options matches 1 run function turtlecraft:entity/global_update/tick


# Trigger commands
scoreboard players enable @a TurtleCraft
execute as @a[scores={TurtleCraft=..-1}] at @s run function turtlecraft:code/trigger/edit
execute as @a[scores={TurtleCraft=1..}] at @s run function turtlecraft:code/trigger/load


# Spawn turtle from egg
execute as @e[type=minecraft:marker,tag=turtlecraft.egg] at @s positioned ~ ~0.5 ~ align xyz positioned ~0.5 ~ ~0.5 run function turtlecraft:entity/spawn/init


# Lock llamas' decor slot
execute as @e[type=minecraft:llama,tag=turtlecraft.body] at @s if entity @a[distance=..10] run function turtlecraft:entity/llama_slot_item
clear @a #turtlecraft:clear[minecraft:custom_data={turtlecraft:{ClearItem:1b}}]


# Execute turtle code
execute unless score paused turtlecraft.options matches 1 run function turtlecraft:code/run/tick

