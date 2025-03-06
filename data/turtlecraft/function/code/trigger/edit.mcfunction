# Function triggered by a player
scoreboard players operation @s turtlecraft.trigger *= #_1 turtlecraft.math
execute if score @s turtlecraft.trigger matches 1..99 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"You should use positive numbers here!\n","color":"gray"}]
execute if score @s turtlecraft.trigger matches 100..999 run function turtlecraft:code/edit/find_turtle
execute if score @s turtlecraft.trigger matches 1000.. run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"You should use positive numbers here!\n","color":"gray"}]
scoreboard players set @s turtlecraft.trigger 0
