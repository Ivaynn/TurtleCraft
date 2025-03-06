# Executed by turtlecraft.body at mined block coordinates. All turtle entities have "turtlecraft.tmp"

execute if score $chunk_loaded turtlecraft.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded turtlecraft.tmp 0
execute if score $chunk_loaded turtlecraft.tmp matches 0 run return 0

execute if block ~ ~ ~ #turtlecraft:unbreakable unless block ~ ~ ~ #turtlecraft:no_hitbox run scoreboard players set @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.msg 3
execute if score $safe_mine turtlecraft.tmp matches 1 if block ~ ~ ~ #turtlecraft:safe_mine run scoreboard players set @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.msg 3

execute if score $safe_mine turtlecraft.tmp matches 1 unless block ~ ~ ~ #turtlecraft:safe_mine unless block ~ ~ ~ #turtlecraft:unbreakable run function turtlecraft:code/run/instructions/mine/mine
execute if score $safe_mine turtlecraft.tmp matches 0 unless block ~ ~ ~ #turtlecraft:unbreakable run function turtlecraft:code/run/instructions/mine/mine
