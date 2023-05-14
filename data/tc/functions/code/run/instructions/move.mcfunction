# Executed by tc.body at goal coordinates. All turtle entities have "tc.tmp"

# Automine for "forward", "up" and "down"
execute if score $auto_mine tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 unless block ~ ~ ~ #tc:no_hitbox run function tc:code/run/instructions/mine/init
execute if score $auto_mine tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 unless block ~ ~ ~ #tc:no_hitbox run function tc:code/run/instructions/mine/init
execute if score $auto_mine tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ unless block ~ ~ ~ #tc:no_hitbox run function tc:code/run/instructions/mine/init
execute if score $auto_mine tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ unless block ~ ~ ~ #tc:no_hitbox run function tc:code/run/instructions/mine/init
execute if score $auto_mine tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ unless block ~ ~ ~ #tc:no_hitbox run function tc:code/run/instructions/mine/init
execute if score $auto_mine tc.tmp matches 1 if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ unless block ~ ~ ~ #tc:no_hitbox run function tc:code/run/instructions/mine/init


# Move if block can be passed through
execute unless block ~ ~1 ~ #tc:no_hitbox unless score @s tc.msg matches 1.. run scoreboard players set @s tc.msg 2
execute if block ~ ~1 ~ #tc:no_hitbox align xyz run tp @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base] ~0.5 ~ ~0.5
