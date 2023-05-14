# Executed by the player. All turtle components have tag "tc.tmp"

tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This turtle was locked by ","color":"gray"},{"entity":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","nbt":"ArmorItems[0].tag.Owner.Name","interpret":true,"color":"gray"},"\n"]
scoreboard players reset @s tc.id
