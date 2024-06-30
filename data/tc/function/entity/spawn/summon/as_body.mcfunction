
data merge entity @s {Tags:["tc.turtle","tc.body","tc.tmp"], NoAI:1b, Silent:1b, Tame:1b, Strength:5, ChestedHorse:1b, InLove:2147483647, PortalCooldown:2147483647, Rotation:[0.0f,30.0f], CustomNameVisible:0b, CustomName:'{"text":"Turtle"}', Health:1024f, attributes:[{id:"generic.max_health",base:1024}], ArmorItems:[{id:"minecraft:stick",count:1b,components:{"minecraft:custom_data":{tc:{Instructions:[{Version:2, AutoMine:1b, PauseOnError:1b, Locked:1b, AutoFuel:0b, SafeMine:1b, ShowText:0b, DamagePlayers:0b, ClearCounters:1b, Silent:0b}]}}}},{},{},{id:"minecraft:stick",count:1b,components:{"minecraft:custom_data":{tc:{Counters:[]}}}}], ArmorDropChances:[-999.000F,-999.000F,-999.000F,-999.000F]}
scoreboard players operation @s tc.id = $new tc.id
scoreboard players operation @s tc.update_id = $update_id tc.tmp

tp @s ~ ~10 ~


# Load data from egg storage
data modify entity @s CustomName set from storage tc:tmp new_turtle.Name
data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions set from storage tc:tmp new_turtle.Instructions
execute store result score @s tc.fuel run data get storage tc:tmp new_turtle.Fuel


# Show "Hello!" text
scoreboard players set @s tc.msg 10


# Ride
ride @s mount @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.base]


# Empty item slot + update
function tc:entity/empty_item_slot
function tc:entity/update
tag @e[type=#tc:turtle_parts,tag=tc.turtle] remove tc.tmp
