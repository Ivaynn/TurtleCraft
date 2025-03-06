# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"

execute at @s anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~ ~0.5 as @e[distance=..5,type=minecraft:item,sort=nearest] run function turtlecraft:code/run/instructions/grab/as_item
scoreboard players reset $sound_played turtlecraft.tmp
