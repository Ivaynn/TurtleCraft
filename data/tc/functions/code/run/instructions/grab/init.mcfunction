# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"

execute at @s anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~ ~0.5 as @e[distance=..5,type=minecraft:item,sort=nearest] run function tc:code/run/instructions/grab/as_item
scoreboard players reset $sound_played tc.tmp
