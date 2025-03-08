# Executed by player who is interacting - all turtle parts have tag "turtlecraft.tmp"

advancement grant @s only turtlecraft:fuel

# Get fuel power
execute if data entity @s {SelectedItem:{id:"minecraft:coal_block"}} run scoreboard players set $fuel_power turtlecraft.tmp 80
execute if data entity @s {SelectedItem:{id:"minecraft:blaze_rod"}} run scoreboard players set $fuel_power turtlecraft.tmp 12
execute if data entity @s {SelectedItem:{id:"minecraft:coal"}} run scoreboard players set $fuel_power turtlecraft.tmp 8
execute if data entity @s {SelectedItem:{id:"minecraft:charcoal"}} run scoreboard players set $fuel_power turtlecraft.tmp 8


# Apply multiplier
scoreboard players operation $fuel_power turtlecraft.tmp *= fuel_multiplier turtlecraft.options
scoreboard players operation $fuel_power turtlecraft.tmp /= #100 turtlecraft.math

#tellraw @a ["",{"score":{"objective": "turtlecraft.tmp","name": "$fuel_power"}}]

# Get count and apply result to turtle. Don't let it overflow (can't go above 2147483647)
execute store result score $fuel_count turtlecraft.tmp run data get entity @s SelectedItem.count
scoreboard players operation $fuel_power turtlecraft.tmp *= $fuel_count turtlecraft.tmp
scoreboard players operation $fuel_level turtlecraft.tmp = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.fuel
scoreboard players operation $fuel_level turtlecraft.tmp += $fuel_power turtlecraft.tmp
execute if score $fuel_level turtlecraft.tmp matches 1.. run scoreboard players operation @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.fuel = $fuel_level turtlecraft.tmp
execute unless score $fuel_level turtlecraft.tmp matches 1.. run scoreboard players reset $fuel_power turtlecraft.tmp


# Message
execute if score $fuel_power turtlecraft.tmp matches 1.. run tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Added ","color":"gray"},{"score":{"name":"$fuel_power","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" fuel. Total: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body]","objective":"turtlecraft.fuel"},"color":"gray"},"\n"]
execute unless score $fuel_power turtlecraft.tmp matches 1.. run tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"You can't use this! ","color":"gray"},"\n"]


# Clear item
execute if score $fuel_power turtlecraft.tmp matches 1.. run item replace entity @s weapon with minecraft:air


# Effects
execute store result score $silent turtlecraft.tmp run data get entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] ArmorItems[0].components."minecraft:custom_data".turtlecraft.Instructions[0].Silent 1
execute unless score $silent turtlecraft.tmp matches 1 if score $fuel_power turtlecraft.tmp matches 1.. at @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run playsound minecraft:block.fire.extinguish neutral @a ~ ~1 ~ 1 1.8
execute if score $fuel_power turtlecraft.tmp matches 1.. at @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run particle minecraft:flame ~ ~1.5 ~ 0.25 0.25 0.25 0.05 5 normal @a


# Clear tmp
scoreboard players reset $silent turtlecraft.tmp
scoreboard players reset $fuel_count turtlecraft.tmp
scoreboard players reset $fuel_power turtlecraft.tmp
scoreboard players reset $fuel_level turtlecraft.tmp
