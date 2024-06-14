# Executed by player who is interacting - all turtle parts have tag "tc.tmp"

advancement grant @s only tc:fuel

# Get fuel power
execute if data entity @s {SelectedItem:{id:"minecraft:coal_block"}} run scoreboard players set $fuel_power tc.tmp 80
execute if data entity @s {SelectedItem:{id:"minecraft:blaze_rod"}} run scoreboard players set $fuel_power tc.tmp 12
execute if data entity @s {SelectedItem:{id:"minecraft:coal"}} run scoreboard players set $fuel_power tc.tmp 8
execute if data entity @s {SelectedItem:{id:"minecraft:charcoal"}} run scoreboard players set $fuel_power tc.tmp 8


# Apply multiplier
scoreboard players operation $fuel_power tc.tmp *= fuel_multiplier tc.options
scoreboard players operation $fuel_power tc.tmp /= #100 tc.math

tellraw @a ["",{"score":{"objective": "tc.tmp","name": "$fuel_power"}}]



# Get count and apply result to turtle. Don't let it overflow (can't go above 2147483647)
execute store result score $fuel_count tc.tmp run data get entity @s SelectedItem.count
scoreboard players operation $fuel_power tc.tmp *= $fuel_count tc.tmp
scoreboard players operation $fuel_level tc.tmp = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.fuel
scoreboard players operation $fuel_level tc.tmp += $fuel_power tc.tmp
execute if score $fuel_level tc.tmp matches 1.. run scoreboard players operation @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.fuel = $fuel_level tc.tmp
execute unless score $fuel_level tc.tmp matches 1.. run scoreboard players reset $fuel_power tc.tmp


# Message
execute if score $fuel_power tc.tmp matches 1.. run tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"Added ","color":"gray"},{"score":{"name":"$fuel_power","objective":"tc.tmp"},"color":"gray"},{"text":" fuel. Total: ","color":"gray"},{"score":{"name":"@e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body]","objective":"tc.fuel"},"color":"gray"},"\n"]
execute unless score $fuel_power tc.tmp matches 1.. run tellraw @s ["",{"text":"\n> ","bold":true,"color":"dark_aqua"},{"text":"You can't use this! ","color":"gray"},"\n"]


# Clear item
execute if score $fuel_power tc.tmp matches 1.. run item replace entity @s weapon with minecraft:air


# Effects
execute if score $fuel_power tc.tmp matches 1.. at @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run playsound minecraft:block.fire.extinguish neutral @a ~ ~1 ~ 1 1.8
execute if score $fuel_power tc.tmp matches 1.. at @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run particle minecraft:flame ~ ~1.5 ~ 0.25 0.25 0.25 0.05 5 normal @a


# Clear tmp
scoreboard players reset $fuel_count tc.tmp
scoreboard players reset $fuel_power tc.tmp
scoreboard players reset $fuel_level tc.tmp
