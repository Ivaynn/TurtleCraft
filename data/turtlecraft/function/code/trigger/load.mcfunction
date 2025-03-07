# Function triggered by a player

execute unless predicate turtlecraft:holding_disc run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"You must be holding a music disc to import instructions!\n","color":"gray"}]
execute if predicate turtlecraft:holding_disc run function turtlecraft:code/trigger/load_start
scoreboard players set @s TurtleCraft 0
