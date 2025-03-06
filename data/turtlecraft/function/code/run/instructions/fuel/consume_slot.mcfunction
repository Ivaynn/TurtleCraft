# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"

# Get fuel count + item count
scoreboard players operation $fuel_consumed turtlecraft.tmp = $fuel_count turtlecraft.tmp

execute store result score $item_count turtlecraft.tmp run data get storage turtlecraft:tmp llama_items[0].count


scoreboard players operation $item_count turtlecraft.tmp -= $fuel_count turtlecraft.tmp 
execute if score $item_count turtlecraft.tmp matches ..-1 run scoreboard players operation $fuel_count turtlecraft.tmp = $item_count turtlecraft.tmp
execute if score $item_count turtlecraft.tmp matches ..-1 run scoreboard players operation $fuel_count turtlecraft.tmp *= #_1 turtlecraft.math
execute if score $item_count turtlecraft.tmp matches 0.. run scoreboard players set $fuel_count turtlecraft.tmp 0

scoreboard players operation $fuel_consumed turtlecraft.tmp -= $fuel_count turtlecraft.tmp


# Add new fuel to score
execute if data storage turtlecraft:tmp {this_slot:{id:"minecraft:coal_block"}} run scoreboard players set $fuel_power turtlecraft.tmp 80
execute if data storage turtlecraft:tmp {this_slot:{id:"minecraft:blaze_rod"}} run scoreboard players set $fuel_power turtlecraft.tmp 12
execute if data storage turtlecraft:tmp {this_slot:{id:"minecraft:coal"}} run scoreboard players set $fuel_power turtlecraft.tmp 8
execute if data storage turtlecraft:tmp {this_slot:{id:"minecraft:charcoal"}} run scoreboard players set $fuel_power turtlecraft.tmp 8


# Apply multiplier
scoreboard players operation $fuel_power turtlecraft.tmp *= fuel_multiplier turtlecraft.options
scoreboard players operation $fuel_power turtlecraft.tmp /= #100 turtlecraft.math


# Apply result to turtle. Don't let it overflow (can't go above 2147483647)
scoreboard players operation $fuel_power turtlecraft.tmp *= $fuel_consumed turtlecraft.tmp
scoreboard players operation $fuel_level turtlecraft.tmp = @s turtlecraft.fuel
scoreboard players operation $fuel_level turtlecraft.tmp += $fuel_power turtlecraft.tmp
execute unless score $fuel_level turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/fuel/keep_slot
execute if score $fuel_level turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/fuel/update_item


# Clear tmp
scoreboard players reset $fuel_consumed turtlecraft.tmp
scoreboard players reset $item_count turtlecraft.tmp
scoreboard players reset $fuel_level turtlecraft.tmp
scoreboard players reset $fuel_power turtlecraft.tmp
