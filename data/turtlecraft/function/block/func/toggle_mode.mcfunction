execute unless data block ~ ~ ~ lock.components.minecraft:custom_data."turtlecraft.block".Instructions[1] run return run tellraw @s ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"Nothing to execute!\n","color":"gray"}]

scoreboard players add @n[type=block_display] turtlecraft.s.mode 1
execute as @n[type=block_display] if score @s turtlecraft.s.mode matches 2 run scoreboard players set @s turtlecraft.s.mode 0

execute align xyz run playsound minecraft:ui.button.click block @a[distance=..10] ~.5 ~.5 ~.5 .15

function turtlecraft:block/message/main_menu