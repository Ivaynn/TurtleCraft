# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"

execute if score @s turtlecraft.line matches 1.. run scoreboard players set $toggle turtlecraft.tmp 0
execute unless score @s turtlecraft.line matches 1.. run scoreboard players set $toggle turtlecraft.tmp 1
execute if score $toggle turtlecraft.tmp matches 0 run function turtlecraft:code/stop
execute if score $toggle turtlecraft.tmp matches 0 run scoreboard players set @s turtlecraft.msg 8
execute if score $toggle turtlecraft.tmp matches 1 run function turtlecraft:code/start
scoreboard players reset $toggle turtlecraft.tmp
