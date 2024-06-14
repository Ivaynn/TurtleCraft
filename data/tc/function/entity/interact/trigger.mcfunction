# This function is triggered by an advancement
advancement revoke @s only tc:root

# Check if the nearest turtle took damage this tick
tag @s add tc.player
execute as @e[distance=..10,type=minecraft:llama,tag=tc.body] at @s run function tc:entity/interact/check_attacker
tag @s remove tc.player
