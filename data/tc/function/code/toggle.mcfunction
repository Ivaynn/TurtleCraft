# Executed by tc.body - all attached entities have "tc.tmp"

execute if score @s tc.line matches 1.. run scoreboard players set $toggle tc.tmp 0
execute unless score @s tc.line matches 1.. run scoreboard players set $toggle tc.tmp 1
execute if score $toggle tc.tmp matches 0 run function tc:code/stop
execute if score $toggle tc.tmp matches 0 run scoreboard players set @s tc.msg 8
execute if score $toggle tc.tmp matches 1 run function tc:code/start
scoreboard players reset $toggle tc.tmp
