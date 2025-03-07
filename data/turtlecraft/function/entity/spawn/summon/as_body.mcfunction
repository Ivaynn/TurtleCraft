
data merge entity @s {Tags:["turtlecraft.turtle","turtlecraft.body","turtlecraft.tmp"], NoAI:1b, Silent:1b, Tame:1b, Strength:5, ChestedHorse:1b, InLove:2147483647, PortalCooldown:2147483647, Rotation:[0.0f,30.0f], CustomNameVisible:0b, CustomName:'{"text":"Turtle"}', Health:1024f, attributes:[{id:"max_health",base:1024}], ArmorItems:[{id:"minecraft:stick",count:1b,components:{"minecraft:custom_data":{turtlecraft:{Instructions:[{Version:2, AutoMine:1b, PauseOnError:1b, Locked:1b, AutoFuel:0b, SafeMine:1b, ShowText:0b, DamagePlayers:0b, ClearCounters:1b, Silent:0b}]}}}},{},{},{id:"minecraft:stick",count:1b,components:{"minecraft:custom_data":{turtlecraft:{Counters:[]}}}}], ArmorDropChances:[-999.000F,-999.000F,-999.000F,-999.000F]}
scoreboard players operation @s turtlecraft.id = $new turtlecraft.id
scoreboard players operation @s turtlecraft.update_id = $update_id turtlecraft.tmp

tp @s ~ ~10 ~


# Load data from egg storage
data modify entity @s CustomName set from storage turtlecraft:tmp new_turtle.Name
data modify entity @s ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions set from storage turtlecraft:tmp new_turtle.Instructions
execute store result score @s turtlecraft.fuel run data get storage turtlecraft:tmp new_turtle.Fuel


# Show "Hello!" text
scoreboard players set @s turtlecraft.msg 10


# Program version (upgrade for future versions)
execute store result score @s turtlecraft.version run data get storage turtlecraft:tmp new_turtle.Instructions[0].Version
execute unless score @s turtlecraft.version matches 3.. run scoreboard players set @s turtlecraft.version 3


# Ride
ride @s mount @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.base]


# Empty item slot + update
function turtlecraft:entity/empty_item_slot
function turtlecraft:entity/update
tag @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] remove turtlecraft.tmp
