# Function triggered by a player


# Find turtle entities linked to this player
tag @s add tc.player
scoreboard players set $found_turtle tc.tmp 0
execute at @s as @e[distance=..10,type=minecraft:llama,tag=tc.body] if score @s tc.id = @p[distance=..0.01,tag=tc.player] tc.id store result score $found_turtle tc.tmp run function tc:entity/tag_entities
tag @s remove tc.player


# Not found: reset + error message
execute if score $found_turtle tc.tmp matches 0 run function tc:reset_player
execute if score $found_turtle tc.tmp matches 0 run tellraw @s ["",{"text":"\n> ","color":"red","bold": true},{"text":"Turtle not found!\n","color":"gray"}]


# Found: check owner? + init
execute if score $found_turtle tc.tmp matches 1 if score locked_turtles tc.options matches 1 run function tc:code/edit/check_owner
execute if score $found_turtle tc.tmp matches 1 if score locked_turtles tc.options matches 0 run function tc:code/edit/init


# Clear tmp
scoreboard players reset $found_turtle tc.tmp
tag @e[type=#tc:turtle_parts,tag=tc.turtle] remove tc.tmp
