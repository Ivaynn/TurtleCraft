# Function triggered by a player


# Find turtle entities linked to this player
tag @s add turtlecraft.player
scoreboard players set $found_turtle turtlecraft.tmp 0
execute at @s as @e[distance=..10,type=minecraft:llama,tag=turtlecraft.body] if score @s turtlecraft.id = @p[distance=..0.01,tag=turtlecraft.player] turtlecraft.id store result score $found_turtle turtlecraft.tmp run function turtlecraft:entity/tag_entities
tag @s remove turtlecraft.player


# Not found: reset + error message
execute if score $found_turtle turtlecraft.tmp matches 0 run function turtlecraft:reset_player
execute if score $found_turtle turtlecraft.tmp matches 0 run tellraw @s ["",{"text":"\n> ","color":"red","bold": true},{"text":"Turtle not found!\n","color":"gray"}]


# Found: check owner? + init
execute if score $found_turtle turtlecraft.tmp matches 1 if score locked_turtles turtlecraft.options matches 1 run function turtlecraft:code/edit/check_owner
execute if score $found_turtle turtlecraft.tmp matches 1 if score locked_turtles turtlecraft.options matches 0 run function turtlecraft:code/edit/init


# Clear tmp
scoreboard players reset $found_turtle turtlecraft.tmp
tag @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] remove turtlecraft.tmp
