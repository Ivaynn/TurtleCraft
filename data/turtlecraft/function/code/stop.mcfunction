# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"


scoreboard players set @s turtlecraft.line 0
scoreboard players reset @s turtlecraft.timer

tag @s remove turtlecraft.breakpoint

execute store result score $silent turtlecraft.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].Silent 1
execute store result score $sound_line turtlecraft.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions
execute unless score $silent turtlecraft.tmp matches 1 if score $sound_line turtlecraft.tmp matches 3.. run playsound minecraft:block.lever.click neutral @a ~ ~ ~ 1 0.5

scoreboard players reset $silent turtlecraft.tmp
scoreboard players reset $sound_line turtlecraft.tmp
