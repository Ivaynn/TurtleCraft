# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"

execute store result score $lines turtlecraft.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions

execute if score $lines turtlecraft.tmp matches 2.. run scoreboard players set @s turtlecraft.line 1
execute if score $lines turtlecraft.tmp matches 2.. if score @s turtlecraft.fuel matches 1.. if score use_fuel turtlecraft.options matches 1 run scoreboard players operation @s turtlecraft.timer = delay_fueled turtlecraft.options
execute if score $lines turtlecraft.tmp matches 2.. if score @s turtlecraft.fuel matches 1.. unless score use_fuel turtlecraft.options matches 1 run scoreboard players operation @s turtlecraft.timer = delay_normal turtlecraft.options
execute if score $lines turtlecraft.tmp matches 2.. unless score @s turtlecraft.fuel matches 1.. run scoreboard players operation @s turtlecraft.timer = delay_normal turtlecraft.options
execute if score $lines turtlecraft.tmp matches 2.. run scoreboard players reset @s turtlecraft.msg

tag @s remove turtlecraft.breakpoint


# Effects
execute store result score $silent turtlecraft.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].Silent 1
execute unless score $silent turtlecraft.tmp matches 1 run playsound minecraft:block.lever.click neutral @a ~ ~ ~ 1 0.6


# Clear counters
execute store result score $clear_counters turtlecraft.tmp run data get entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].ClearCounters 1
execute if score $clear_counters turtlecraft.tmp matches 1 run data modify entity @s ArmorItems[3] set value {id:"minecraft:stick",count:1b,components:{"minecraft:custom_data":{turtlecraft:{Counters:[]}}}}


# Clear tmp
scoreboard players reset $silent turtlecraft.tmp
scoreboard players reset $clear_counters turtlecraft.tmp
scoreboard players reset $lines turtlecraft.tmp
