# Executed by the server EVERY TICK


# Relog
execute as @a[scores={tc.relog=1..}] run function tc:reset_player


# Update every turtle every 5 seconds, spread according to its ID
execute if score global_update tc.options matches 1 run function tc:entity/global_update/tick


# Trigger commands
scoreboard players enable @a tc.trigger
execute as @a[scores={tc.trigger=..-1}] at @s run function tc:code/trigger/edit
execute as @a[scores={tc.trigger=1..}] at @s run function tc:code/trigger/load


# Spawn turtle from egg
execute as @e[type=minecraft:marker,tag=tc.egg] at @s positioned ~ ~0.5 ~ align xyz positioned ~0.5 ~ ~0.5 run function tc:entity/spawn/init


# Lock llamas' decor slot
execute as @e[type=minecraft:llama,tag=tc.body] at @s if entity @a[distance=..10] run function tc:entity/llama_slot_item
clear @a #tc:clear[minecraft:custom_data={tc:{ClearItem:1b}}]


# Execute turtle code
execute unless score paused tc.options matches 1 run function tc:code/run/tick

