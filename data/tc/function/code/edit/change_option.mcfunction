# Executed by tc.tmp. All turtle components have tag "tc.tmp"


## Get options
data modify storage tc:tmp Options set from entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0]
execute store result score $auto_mine tc.tmp run data get storage tc:tmp Options.AutoMine 1
execute store result score $error_pause tc.tmp run data get storage tc:tmp Options.PauseOnError 1
execute store result score $turtle_lock tc.tmp run data get storage tc:tmp Options.Locked 1
execute store result score $auto_fuel tc.tmp run data get storage tc:tmp Options.AutoFuel 1
execute store result score $safe_mine tc.tmp run data get storage tc:tmp Options.SafeMine 1
execute store result score $show_text tc.tmp run data get storage tc:tmp Options.ShowText 1
execute store result score $damage_players tc.tmp run data get storage tc:tmp Options.DamagePlayers 1



## Update option
# AutoMine
execute if score $argument tc.tmp matches 1 if score $auto_mine tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].AutoMine set value 0b
execute if score $argument tc.tmp matches 1 if score $auto_mine tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].AutoMine set value 1b

# PauseOnError
execute if score $argument tc.tmp matches 2 if score $error_pause tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].PauseOnError set value 0b
execute if score $argument tc.tmp matches 2 if score $error_pause tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].PauseOnError set value 1b

# Locked
execute if score $argument tc.tmp matches 3 if score $turtle_lock tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].Locked set value 0b
execute if score $argument tc.tmp matches 3 if score $turtle_lock tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].Locked set value 1b

# AutoFuel
execute if score $argument tc.tmp matches 4 if score $auto_fuel tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].AutoFuel set value 0b
execute if score $argument tc.tmp matches 4 if score $auto_fuel tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].AutoFuel set value 1b

# SafeMine
execute if score $argument tc.tmp matches 5 if score $safe_mine tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].SafeMine set value 0b
execute if score $argument tc.tmp matches 5 if score $safe_mine tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].SafeMine set value 1b

# ShowText
execute if score $argument tc.tmp matches 6 if score $show_text tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].ShowText set value 0b
execute if score $argument tc.tmp matches 6 if score $show_text tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].ShowText set value 1b

# DamagePlayers
execute if score $argument tc.tmp matches 7 if score $damage_players tc.tmp matches 1 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].DamagePlayers set value 0b
execute if score $argument tc.tmp matches 7 if score $damage_players tc.tmp matches 0 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].DamagePlayers set value 1b


## Other buttons

# Reset
execute if score $argument tc.tmp matches 99 run function tc:code/stop
execute if score $argument tc.tmp matches 99 run data modify entity @s ArmorItems[0].components."minecraft:custom_data".tc.Instructions set value [{AutoMine:1b, PauseOnError:1b, Locked:1b, AutoFuel:1b, SafeMine:1b, ShowText:0b, DamagePlayers:0b}]
execute if score $argument tc.tmp matches 99 run data modify entity @s ArmorItems[3] set value {id:"minecraft:stick",count:1b,tag:{Counters:[]}}

# Pick up
execute if score $argument tc.tmp matches 98 run function tc:entity/remove/init

# Close menu
execute if score $argument tc.tmp matches 97 as @p[tag=tc.this_player] run function tc:reset_player




## Refresh page?
execute if score $argument tc.tmp matches 97..98 as @p[tag=tc.this_player] run function tc:code/edit/display/pages/blank
execute if score $argument tc.tmp matches 97 as @p[tag=tc.this_player] run tellraw @s ["",{"text":"> ","bold":true,"color":"dark_aqua"},{"text":"Menu closed","color":"gray"}]
execute if score $argument tc.tmp matches 98 as @p[tag=tc.this_player] run tellraw @s ["",{"text":"> ","bold":true,"color":"dark_aqua"},{"text":"Turtle removed","color":"gray"}]


execute if score $argument tc.tmp matches 1..10 run scoreboard players set $display_page tc.tmp 5
execute if score $argument tc.tmp matches 99 run scoreboard players set $display_page tc.tmp 5



## Clear tmp
data remove storage tc:tmp Options
scoreboard players reset $auto_mine tc.tmp
scoreboard players reset $error_pause tc.tmp
scoreboard players reset $turtle_lock tc.tmp
scoreboard players reset $auto_fuel tc.tmp
scoreboard players reset $safe_mine tc.tmp
scoreboard players reset $show_text tc.tmp
scoreboard players reset $damage_players tc.tmp
