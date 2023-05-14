# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


data modify storage tc:tmp llama_items set from entity @s Items
execute store result score $llama_slots tc.tmp run data get storage tc:tmp llama_items

setblock 10028 1 10028 minecraft:yellow_shulker_box
execute if score $llama_slots tc.tmp matches 1.. run function tc:code/run/instructions/drop/for_llama_slot


# Put items back in llama
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:air{drop_contents:1b}


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp llama_items
data remove storage tc:tmp this_slot
scoreboard players reset $llama_slots tc.tmp
scoreboard players reset $sound_played tc.tmp
