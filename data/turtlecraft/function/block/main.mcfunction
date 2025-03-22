execute as @e[tag=turtlecraft.server,type=block_display] at @s positioned ~0.0005 ~0.0005 ~0.0005 align xyz unless block ~ ~ ~ crafter run kill @s
execute as @e[tag=turtlecraft.server,type=text_display] at @s positioned ~ ~-.5 ~ align xyz unless block ~ ~ ~ crafter run kill @s

execute as @e[tag=turtlecraft.server,type=block_display] unless score @s turtlecraft.s.id matches 0.. at @s positioned ~0.0005 ~0.0005 ~0.0005 store result score @s turtlecraft.s.id run data get block ~ ~ ~ lock.components.minecraft:custom_data.'turtlecraft.block'.id

execute as @e[tag=turtlecraft.server,type=block_display,scores={turtlecraft.s.mode=1}] if score @s turtlecraft.s.id matches 0.. at @s positioned ~0.1 ~0.1 ~0.1 align xyz run function turtlecraft:block/line
