scoreboard players set @s turtlecraft.s.line 1

execute at @s as @e[type=block_display,tag=turtlecraft.server,distance=..8] if score @s turtlecraft.s.id = @n[type=player] turtlecraft.s.id at @s as @n[type=player] positioned ~.1 ~.1 ~.1 align xyz run return run function turtlecraft:block/message/edit

tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"Server not found!\n","color":"gray"}]
scoreboard players reset @s turtlecraft.s.id