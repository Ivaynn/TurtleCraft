# Executed by turtlecraft.base. All turtle components have tag "turtlecraft.tmp"

# Dismount player riding
execute unless score ride_turtles turtlecraft.options matches 1 as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] on passengers if entity @s[type=minecraft:player] run ride @s dismount


# Move: forward, back, left, right, up, down
execute if score $argument turtlecraft.tmp matches 1 positioned ^ ^ ^1 if block ~ ~1 ~ #turtlecraft:no_hitbox run tp @s ~ ~ ~
execute if score $argument turtlecraft.tmp matches 2 positioned ^ ^ ^-1 if block ~ ~1 ~ #turtlecraft:no_hitbox run tp @s ~ ~ ~
execute if score $argument turtlecraft.tmp matches 3 positioned ^1 ^ ^ if block ~ ~1 ~ #turtlecraft:no_hitbox run tp @s ~ ~ ~
execute if score $argument turtlecraft.tmp matches 4 positioned ^-1 ^ ^ if block ~ ~1 ~ #turtlecraft:no_hitbox run tp @s ~ ~ ~
execute if score $argument turtlecraft.tmp matches 5 positioned ^ ^1 ^ if block ~ ~1 ~ #turtlecraft:no_hitbox run tp @s ~ ~ ~
execute if score $argument turtlecraft.tmp matches 6 positioned ^ ^-1 ^ if block ~ ~1 ~ #turtlecraft:no_hitbox run tp @s ~ ~ ~

# Turn: left, right, back
execute if score $argument turtlecraft.tmp matches 7 run tp @s ~ ~ ~ ~-90 ~
execute if score $argument turtlecraft.tmp matches 8 run tp @s ~ ~ ~ ~90 ~
execute if score $argument turtlecraft.tmp matches 9 run tp @s ~ ~ ~ ~180 ~

# Update
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:entity/update
