# Executed by tc.base. All turtle components have tag "tc.tmp"

# Dismount player riding
execute unless score ride_turtles tc.options matches 1 as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] on passengers if entity @s[type=minecraft:player] run ride @s dismount


# Move: forward, back, left, right, up, down
execute if score $argument tc.tmp matches 1 positioned ^ ^ ^1 if block ~ ~1 ~ #tc:no_hitbox run tp @s ~ ~ ~
execute if score $argument tc.tmp matches 2 positioned ^ ^ ^-1 if block ~ ~1 ~ #tc:no_hitbox run tp @s ~ ~ ~
execute if score $argument tc.tmp matches 3 positioned ^1 ^ ^ if block ~ ~1 ~ #tc:no_hitbox run tp @s ~ ~ ~
execute if score $argument tc.tmp matches 4 positioned ^-1 ^ ^ if block ~ ~1 ~ #tc:no_hitbox run tp @s ~ ~ ~
execute if score $argument tc.tmp matches 5 positioned ^ ^1 ^ if block ~ ~1 ~ #tc:no_hitbox run tp @s ~ ~ ~
execute if score $argument tc.tmp matches 6 positioned ^ ^-1 ^ if block ~ ~1 ~ #tc:no_hitbox run tp @s ~ ~ ~

# Turn: left, right, back
execute if score $argument tc.tmp matches 7 run tp @s ~ ~ ~ ~-90 ~
execute if score $argument tc.tmp matches 8 run tp @s ~ ~ ~ ~90 ~
execute if score $argument tc.tmp matches 9 run tp @s ~ ~ ~ ~180 ~

# Update
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:entity/update
