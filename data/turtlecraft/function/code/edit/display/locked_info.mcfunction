# Executed by the player. All turtle components have tag "turtlecraft.tmp"

tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This turtle was locked by ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","nbt":"equipment.feet.components.minecraft:custom_data.turtlecraft.Owner.Name","interpret":true,"color":"gray"},"\n"]
scoreboard players reset @s turtlecraft.id
