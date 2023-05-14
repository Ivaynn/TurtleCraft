# Function triggered by a player
scoreboard players operation @s tc.trigger *= #_1 tc.math
execute if score @s tc.trigger matches 1..99 run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"You should use positive numbers here!\n","color":"gray"}]
execute if score @s tc.trigger matches 100..999 run function tc:code/edit/find_turtle
execute if score @s tc.trigger matches 1000.. run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"You should use positive numbers here!\n","color":"gray"}]
scoreboard players set @s tc.trigger 0
