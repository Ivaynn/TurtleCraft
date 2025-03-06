# Executed by turtlecraft.body at goal coordinates. All turtle entities have "turtlecraft.tmp"

execute if score $chunk_loaded turtlecraft.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded turtlecraft.tmp 0
execute if score $chunk_loaded turtlecraft.tmp matches 0 run return 0

# Automine for "forward", "up" and "down"
execute if score $auto_mine turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 unless block ~ ~ ~ #turtlecraft:no_hitbox run function turtlecraft:code/run/instructions/mine/init
execute if score $auto_mine turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 unless block ~ ~ ~ #turtlecraft:no_hitbox run function turtlecraft:code/run/instructions/mine/init
execute if score $auto_mine turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ unless block ~ ~ ~ #turtlecraft:no_hitbox run function turtlecraft:code/run/instructions/mine/init
execute if score $auto_mine turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ unless block ~ ~ ~ #turtlecraft:no_hitbox run function turtlecraft:code/run/instructions/mine/init
execute if score $auto_mine turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ unless block ~ ~ ~ #turtlecraft:no_hitbox run function turtlecraft:code/run/instructions/mine/init
execute if score $auto_mine turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ unless block ~ ~ ~ #turtlecraft:no_hitbox run function turtlecraft:code/run/instructions/mine/init


# Move if block can be passed through
execute unless block ~ ~1 ~ #turtlecraft:no_hitbox unless score @s turtlecraft.msg matches 1.. run scoreboard players set @s turtlecraft.msg 2
execute if block ~ ~1 ~ #turtlecraft:no_hitbox align xyz run tp @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base] ~0.5 ~ ~0.5
