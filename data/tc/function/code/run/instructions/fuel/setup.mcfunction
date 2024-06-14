# Executed by tc.body. All turtle entities have "tc.tmp"

# Init
data modify storage tc:tmp llama_items set from entity @s Items
execute store result score $llama_slots tc.tmp run data get storage tc:tmp llama_items

setblock 10028 1 10028 minecraft:yellow_shulker_box
execute if score $llama_slots tc.tmp matches 1.. run function tc:code/run/instructions/fuel/for_slot


# Put items back in llama
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:air{drop_contents:1b}


# Effects
execute if score $fuel_success tc.tmp matches 1 run playsound minecraft:block.fire.extinguish neutral @a ~ ~ ~ 1 1.8
execute if score $fuel_success tc.tmp matches 1 run particle minecraft:flame ~ ~1.5 ~ 0.25 0.25 0.25 0.05 5 normal @a


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp llama_items
data remove storage tc:tmp fuel_id
data remove storage tc:tmp this_slot
scoreboard players reset $fuel_count tc.tmp
scoreboard players reset $llama_slots tc.tmp
scoreboard players reset $different_id tc.tmp
scoreboard players reset $fuel_success tc.tmp
