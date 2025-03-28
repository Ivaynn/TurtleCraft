# Executed by turtlecraft.tmp. All turtle components have tag "turtlecraft.tmp"


## Get options
data modify storage turtlecraft:tmp Options set from entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0]
execute store result score $auto_mine turtlecraft.tmp run data get storage turtlecraft:tmp Options.AutoMine 1
execute store result score $error_pause turtlecraft.tmp run data get storage turtlecraft:tmp Options.PauseOnError 1
execute store result score $turtle_lock turtlecraft.tmp run data get storage turtlecraft:tmp Options.Locked 1
execute store result score $auto_fuel turtlecraft.tmp run data get storage turtlecraft:tmp Options.AutoFuel 1
execute store result score $safe_mine turtlecraft.tmp run data get storage turtlecraft:tmp Options.SafeMine 1
execute store result score $show_text turtlecraft.tmp run data get storage turtlecraft:tmp Options.ShowText 1
execute store result score $damage_players turtlecraft.tmp run data get storage turtlecraft:tmp Options.DamagePlayers 1
execute store result score $clear_counters turtlecraft.tmp run data get storage turtlecraft:tmp Options.ClearCounters 1
execute store result score $silent turtlecraft.tmp run data get storage turtlecraft:tmp Options.Silent 1



## Update option
# AutoMine
execute if score $argument turtlecraft.tmp matches 1 if score $auto_mine turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].AutoMine set value 0b
execute if score $argument turtlecraft.tmp matches 1 if score $auto_mine turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].AutoMine set value 1b

# PauseOnError
execute if score $argument turtlecraft.tmp matches 2 if score $error_pause turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].PauseOnError set value 0b
execute if score $argument turtlecraft.tmp matches 2 if score $error_pause turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].PauseOnError set value 1b

# Locked
execute if score $argument turtlecraft.tmp matches 3 if score $turtle_lock turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].Locked set value 0b
execute if score $argument turtlecraft.tmp matches 3 if score $turtle_lock turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].Locked set value 1b

# AutoFuel
execute if score $argument turtlecraft.tmp matches 4 if score $auto_fuel turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].AutoFuel set value 0b
execute if score $argument turtlecraft.tmp matches 4 if score $auto_fuel turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].AutoFuel set value 1b

# SafeMine
execute if score $argument turtlecraft.tmp matches 5 if score $safe_mine turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].SafeMine set value 0b
execute if score $argument turtlecraft.tmp matches 5 if score $safe_mine turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].SafeMine set value 1b

# ShowText
execute if score $argument turtlecraft.tmp matches 6 if score $show_text turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].ShowText set value 0b
execute if score $argument turtlecraft.tmp matches 6 if score $show_text turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].ShowText set value 1b

# DamagePlayers
execute if score $argument turtlecraft.tmp matches 7 if score $damage_players turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].DamagePlayers set value 0b
execute if score $argument turtlecraft.tmp matches 7 if score $damage_players turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].DamagePlayers set value 1b

# ClearCounters
execute if score $argument turtlecraft.tmp matches 8 if score $clear_counters turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].ClearCounters set value 0b
execute if score $argument turtlecraft.tmp matches 8 if score $clear_counters turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].ClearCounters set value 1b

# Silent
execute if score $argument turtlecraft.tmp matches 9 if score $silent turtlecraft.tmp matches 1 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].Silent set value 0b
execute if score $argument turtlecraft.tmp matches 9 if score $silent turtlecraft.tmp matches 0 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].Silent set value 1b


## Other buttons

# Reset
execute if score $argument turtlecraft.tmp matches 99 run function turtlecraft:code/stop
execute if score $argument turtlecraft.tmp matches 99 run data modify entity @s equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions set value [{Version:3, AutoMine:1b, PauseOnError:1b, Locked:1b, AutoFuel:0b, SafeMine:1b, ShowText:0b, DamagePlayers:0b, ClearCounters:1b, Silent:0b}]
execute if score $argument turtlecraft.tmp matches 99 run data modify entity @s equipment.head set value {id:"minecraft:stick",count:1b,components:{"minecraft:custom_data":{turtlecraft:{Counters:[]}}}}

# Pick up
execute if score $argument turtlecraft.tmp matches 98 run function turtlecraft:entity/remove/init

# Close menu
execute if score $argument turtlecraft.tmp matches 97 as @p[tag=turtlecraft.this_player] run function turtlecraft:reset_player




## Refresh page?
execute if score $argument turtlecraft.tmp matches 97..98 as @p[tag=turtlecraft.this_player] run function turtlecraft:code/edit/display/pages/blank
execute if score $argument turtlecraft.tmp matches 97 as @p[tag=turtlecraft.this_player] run tellraw @s ["",{"text":"> ","bold":true,"color":"dark_aqua"},{"text":"Menu closed","color":"gray"}]
execute if score $argument turtlecraft.tmp matches 98 as @p[tag=turtlecraft.this_player] run tellraw @s ["",{"text":"> ","bold":true,"color":"dark_aqua"},{"text":"Turtle removed","color":"gray"}]


execute if score $argument turtlecraft.tmp matches 1..10 run scoreboard players set $display_page turtlecraft.tmp 5
execute if score $argument turtlecraft.tmp matches 99 run scoreboard players set $display_page turtlecraft.tmp 5



## Clear tmp
data remove storage turtlecraft:tmp Options
scoreboard players reset $auto_mine turtlecraft.tmp
scoreboard players reset $error_pause turtlecraft.tmp
scoreboard players reset $turtle_lock turtlecraft.tmp
scoreboard players reset $auto_fuel turtlecraft.tmp
scoreboard players reset $safe_mine turtlecraft.tmp
scoreboard players reset $show_text turtlecraft.tmp
scoreboard players reset $damage_players turtlecraft.tmp
scoreboard players reset $clear_counters turtlecraft.tmp
scoreboard players reset $silent turtlecraft.tmp
