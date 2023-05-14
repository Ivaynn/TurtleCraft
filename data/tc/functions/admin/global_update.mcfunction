# Admin function - executed by player directly at any time

execute as @e[tag=tc.turtle] unless score @s tc.id matches 1.. run function tc:entity/global_update/invalid_id
execute as @e[tag=tc.turtle] at @s run function tc:entity/global_update/tag_and_update

tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Updated every turtle in loaded chunks!\n","color":"gray"}]
