# Executed by turtlecraft.body at mined block coordinates. All turtle entities have "turtlecraft.tmp"

execute if score $chunk_loaded turtlecraft.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded turtlecraft.tmp 0
execute if score $chunk_loaded turtlecraft.tmp matches 0 run return 0

# Get crop type
execute if block ~ ~ ~ minecraft:wheat[age=7] run scoreboard players set $crop_type turtlecraft.tmp 1
execute if block ~ ~ ~ minecraft:cocoa[age=2] run scoreboard players set $crop_type turtlecraft.tmp 2
execute if block ~ ~ ~ minecraft:carrots[age=7] run scoreboard players set $crop_type turtlecraft.tmp 3
execute if block ~ ~ ~ minecraft:potatoes[age=7] run scoreboard players set $crop_type turtlecraft.tmp 4
execute if block ~ ~ ~ minecraft:beetroots[age=3] run scoreboard players set $crop_type turtlecraft.tmp 5
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=3] run scoreboard players set $crop_type turtlecraft.tmp 6
execute unless block ~ ~ ~ minecraft:wheat unless block ~ ~ ~ minecraft:cocoa unless block ~ ~ ~ minecraft:carrots unless block ~ ~ ~ minecraft:potatoes unless block ~ ~ ~ minecraft:beetroots unless block ~ ~ ~ minecraft:sweet_berry_bush run scoreboard players set @s turtlecraft.msg 6


# Mine
execute if score $crop_type turtlecraft.tmp matches 1..6 run function turtlecraft:code/run/instructions/mine/init


# Replant
execute if score $crop_type turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp run_line.A.item set value "minecraft:wheat_seeds"
execute if score $crop_type turtlecraft.tmp matches 2 run data modify storage turtlecraft:tmp run_line.A.item set value "minecraft:cocoa_beans"
execute if score $crop_type turtlecraft.tmp matches 3 run data modify storage turtlecraft:tmp run_line.A.item set value "minecraft:carrot"
execute if score $crop_type turtlecraft.tmp matches 4 run data modify storage turtlecraft:tmp run_line.A.item set value "minecraft:potato"
execute if score $crop_type turtlecraft.tmp matches 5 run data modify storage turtlecraft:tmp run_line.A.item set value "minecraft:beetroot_seeds"
execute if score $crop_type turtlecraft.tmp matches 6 run data modify storage turtlecraft:tmp run_line.A.item set value "minecraft:sweet_berries"

execute if score $crop_type turtlecraft.tmp matches 1..6 run function turtlecraft:code/run/instructions/use/init


# If this fails, return fuel
execute unless score $crop_type turtlecraft.tmp matches 1..6 if score @s turtlecraft.fuel matches 1.. if score use_fuel turtlecraft.options matches 1 run scoreboard players add @s turtlecraft.fuel 1


# Clear tmp
scoreboard players reset $crop_type turtlecraft.tmp
