# Executed by tc.body at mined block coordinates. All turtle entities have "tc.tmp"

execute if score $chunk_loaded tc.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded tc.tmp 0
execute if score $chunk_loaded tc.tmp matches 0 run return 0

execute if block ~ ~ ~ #tc:unbreakable unless block ~ ~ ~ #tc:no_hitbox run scoreboard players set @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.msg 3
execute if score $safe_mine tc.tmp matches 1 if block ~ ~ ~ #tc:safe_mine run scoreboard players set @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.msg 3

execute if score $safe_mine tc.tmp matches 1 unless block ~ ~ ~ #tc:safe_mine unless block ~ ~ ~ #tc:unbreakable run function tc:code/run/instructions/mine/mine
execute if score $safe_mine tc.tmp matches 0 unless block ~ ~ ~ #tc:unbreakable run function tc:code/run/instructions/mine/mine
