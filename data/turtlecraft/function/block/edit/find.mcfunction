scoreboard players set temp turtlecraft.tmp 0
execute at @s as @e[type=block_display,tag=turtlecraft.server,distance=..8] if score @s turtlecraft.s.id = @n[type=player] turtlecraft.s.id run scoreboard players set temp turtlecraft.tmp 1
execute if score temp turtlecraft.tmp matches 0 run scoreboard players reset @s turtlecraft.s.id 
execute if score temp turtlecraft.tmp matches 0 run return run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"Server not found!\n","color":"gray"}]
scoreboard players reset temp turtlecraft.tmp

#101X - main menu trigers
execute if score @s TurtleCraft matches 1000 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"Unknown trigger!\n","color":"gray"}]
execute if score @s TurtleCraft matches 1010 run function turtlecraft:block/message/main_menu
execute if score @s TurtleCraft matches 1011 run function turtlecraft:block/message/edit_prepare

execute if score @s TurtleCraft matches 1019 at @s as @e[type=block_display,tag=turtlecraft.server,distance=..8] if score @s turtlecraft.s.id = @n[type=player] turtlecraft.s.id at @s as @n[type=player] positioned ~.1 ~.1 ~.1 align xyz run function turtlecraft:block/func/toggle_mode

#102X - 