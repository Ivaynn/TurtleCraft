# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


data modify storage turtlecraft:tmp llama_items set from entity @s Items
execute store result score $llama_slots turtlecraft.tmp run data get storage turtlecraft:tmp llama_items

setblock 10028 1 10028 minecraft:yellow_shulker_box
execute if score $llama_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/drop/for_llama_slot


# Put items back in llama
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
data remove storage turtlecraft:tmp llama_items
data remove storage turtlecraft:tmp this_slot
scoreboard players reset $llama_slots turtlecraft.tmp
scoreboard players reset $sound_played turtlecraft.tmp
