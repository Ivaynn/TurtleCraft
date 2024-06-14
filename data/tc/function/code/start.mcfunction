# Executed by tc.body - all attached entities have "tc.tmp"

execute store result score $lines tc.tmp run data get entity @s ArmorItems[0].tag.Instructions

execute if score $lines tc.tmp matches 2.. run scoreboard players set @s tc.line 1
execute if score $lines tc.tmp matches 2.. if score @s tc.fuel matches 1.. if score use_fuel tc.options matches 1 run scoreboard players operation @s tc.timer = delay_fueled tc.options
execute if score $lines tc.tmp matches 2.. if score @s tc.fuel matches 1.. unless score use_fuel tc.options matches 1 run scoreboard players operation @s tc.timer = delay_normal tc.options
execute if score $lines tc.tmp matches 2.. unless score @s tc.fuel matches 1.. run scoreboard players operation @s tc.timer = delay_normal tc.options
execute if score $lines tc.tmp matches 2.. run scoreboard players reset @s tc.msg

data modify entity @s ArmorItems[3] set value {id:"minecraft:stick",count:1b,tag:{Counters:[]}}

scoreboard players reset $lines tc.tmp

playsound minecraft:block.lever.click neutral @a ~ ~ ~ 1 0.6
