# Admin function - executed by player directly at any time

execute as @e[tag=turtlecraft.turtle] unless score @s turtlecraft.id matches 1.. run function turtlecraft:entity/global_update/invalid_id
execute as @e[tag=turtlecraft.turtle] at @s run function turtlecraft:entity/global_update/tag_and_update

tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Updated every turtle in loaded chunks!\n","color":"gray"}]
