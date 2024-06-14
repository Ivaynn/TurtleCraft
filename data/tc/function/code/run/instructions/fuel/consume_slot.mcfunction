# Executed by tc.body. All turtle entities have "tc.tmp"

# Get fuel count + item count
scoreboard players operation $fuel_consumed tc.tmp = $fuel_count tc.tmp

execute store result score $item_count tc.tmp run data get storage tc:tmp llama_items[0].count


scoreboard players operation $item_count tc.tmp -= $fuel_count tc.tmp 
execute if score $item_count tc.tmp matches ..-1 run scoreboard players operation $fuel_count tc.tmp = $item_count tc.tmp
execute if score $item_count tc.tmp matches ..-1 run scoreboard players operation $fuel_count tc.tmp *= #_1 tc.math
execute if score $item_count tc.tmp matches 0.. run scoreboard players set $fuel_count tc.tmp 0

scoreboard players operation $fuel_consumed tc.tmp -= $fuel_count tc.tmp


# Add new fuel to score
execute if data storage tc:tmp {this_slot:{id:"minecraft:coal_block"}} run scoreboard players set $fuel_power tc.tmp 80
execute if data storage tc:tmp {this_slot:{id:"minecraft:blaze_rod"}} run scoreboard players set $fuel_power tc.tmp 12
execute if data storage tc:tmp {this_slot:{id:"minecraft:coal"}} run scoreboard players set $fuel_power tc.tmp 8
execute if data storage tc:tmp {this_slot:{id:"minecraft:charcoal"}} run scoreboard players set $fuel_power tc.tmp 8


# Apply multiplier
scoreboard players operation $fuel_power tc.tmp *= fuel_multiplier tc.options
scoreboard players operation $fuel_power tc.tmp /= #100 tc.math


# Apply result to turtle. Don't let it overflow (can't go above 2147483647)
scoreboard players operation $fuel_power tc.tmp *= $fuel_consumed tc.tmp
scoreboard players operation $fuel_level tc.tmp = @s tc.fuel
scoreboard players operation $fuel_level tc.tmp += $fuel_power tc.tmp
execute unless score $fuel_level tc.tmp matches 1.. run function tc:code/run/instructions/fuel/keep_slot
execute if score $fuel_level tc.tmp matches 1.. run function tc:code/run/instructions/fuel/update_item


# Clear tmp
scoreboard players reset $fuel_consumed tc.tmp
scoreboard players reset $item_count tc.tmp
scoreboard players reset $fuel_level tc.tmp
scoreboard players reset $fuel_power tc.tmp
