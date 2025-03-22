scoreboard players remove i turtlecraft.tmp 1
scoreboard players add line turtlecraft.tmp 1
execute if data storage turtlecraft:tmp temp[0] run data remove storage turtlecraft:tmp temp[0]

execute unless data storage turtlecraft:tmp temp[0] run tellraw @s [{"score":{"name":"line","objective":"turtlecraft.tmp"},"color":"dark_gray"}," ",{"text": "| ","color": "dark_gray"}]
execute unless data storage turtlecraft:tmp temp[0] if score i turtlecraft.tmp matches 1.. run return run function turtlecraft:block/message/lines

execute if data storage turtlecraft:tmp temp[0] unless score @s turtlecraft.s.line = line turtlecraft.tmp run tellraw @s [{"score":{"name":"line","objective":"turtlecraft.tmp"},"color":"gray"}," ",{"text": "| ","color": "dark_gray"},{"text":"","color": "white"},{"nbt":"temp[0]","storage":"turtlecraft:tmp","interpret":true}]
execute if score @s turtlecraft.s.line = line turtlecraft.tmp run tellraw @s [{"score":{"name":"line","objective":"turtlecraft.tmp"},"color":"green"}," ",{"text": "| ","color": "dark_green"},{"text":"","color": "white"},{"nbt":"temp[0]","storage":"turtlecraft:tmp","interpret":true}]

# execute align xyz run tellraw @s {"nbt":"lock.components.minecraft:custom_data.'turtlecraft.block'","block":"~ ~ ~"}
execute if score i turtlecraft.tmp matches 1.. run return run function turtlecraft:block/message/lines

scoreboard players reset i turtlecraft.tmp
scoreboard players reset line turtlecraft.tmp
