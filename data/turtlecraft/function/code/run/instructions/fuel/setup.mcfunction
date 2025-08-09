# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"

# Init
data modify storage turtlecraft:tmp llama_items set from entity @s Items
execute store result score $llama_slots turtlecraft.tmp run data get storage turtlecraft:tmp llama_items

scoreboard players set $fuel.bucket.count turtlecraft.tmp 0
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[]}
execute if score $llama_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/fuel/for_slot


# Put updated items back in llama
execute if score $fuel.bucket.count turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/fuel/insert_buckets
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Effects
execute if score $fuel_success turtlecraft.tmp matches 1 unless score $silent turtlecraft.tmp matches 1 run playsound minecraft:block.fire.extinguish neutral @a ~ ~ ~ 1 1.8
execute if score $fuel_success turtlecraft.tmp matches 1 run particle minecraft:flame ~ ~1.5 ~ 0.25 0.25 0.25 0.05 5 normal @a


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
data remove storage turtlecraft:tmp llama_items
data remove storage turtlecraft:tmp fuel_id
data remove storage turtlecraft:tmp this_slot
scoreboard players reset $fuel_count turtlecraft.tmp
scoreboard players reset $llama_slots turtlecraft.tmp
scoreboard players reset $different_id turtlecraft.tmp
scoreboard players reset $fuel_success turtlecraft.tmp
