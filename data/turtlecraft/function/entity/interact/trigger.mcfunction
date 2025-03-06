# This function is triggered by an advancement
advancement revoke @s only turtlecraft:hurt_turtle

# Check if the nearest turtle took damage this tick
tag @s add turtlecraft.player
execute as @e[distance=..10,type=minecraft:llama,tag=turtlecraft.body] at @s run function turtlecraft:entity/interact/check_attacker
tag @s remove turtlecraft.player
