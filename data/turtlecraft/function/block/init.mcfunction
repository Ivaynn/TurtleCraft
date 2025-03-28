execute unless block ~ ~ ~ minecraft:crafter{lock:{components:{"minecraft:custom_data":{turtlecraft.block:{}}}}} run return 0
execute align xyz unless entity @e[tag=turtlecraft.server,distance=..0.01] run return run function turtlecraft:block/summon

stopsound @a block minecraft:block.chest.locked
execute align xyz run playsound minecraft:ui.button.click block @a[distance=..10] ~.5 ~.5 ~.5 .15
title @s actionbar {"text":""}

execute store result score $id turtlecraft.tmp run data get block ~ ~ ~ lock.components."minecraft:custom_data"."turtlecraft.block".id
execute if score $id turtlecraft.tmp matches -1 run scoreboard players add $global_id turtlecraft.server 1
execute if score $id turtlecraft.tmp matches -1 store result block ~ ~ ~ lock.components."minecraft:custom_data"."turtlecraft.block".id int 1 run scoreboard players get $global_id turtlecraft.server
scoreboard players reset $id turtlecraft.tmp

scoreboard players operation @s turtlecraft.s.id = @n[type=block_display,tag=turtlecraft.server] turtlecraft.s.id

function turtlecraft:block/message/main_menu