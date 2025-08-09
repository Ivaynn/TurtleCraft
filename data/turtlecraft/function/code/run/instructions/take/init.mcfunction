# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"

execute if score $chunk_loaded turtlecraft.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded turtlecraft.tmp 0
execute if score $chunk_loaded turtlecraft.tmp matches 0 run return 0

data modify storage turtlecraft:tmp block_items set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items
execute store result score $block_slots turtlecraft.tmp run data get storage turtlecraft:tmp block_items

setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[]}
execute if score $block_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/take/for_block_slot


# Put extra items back into chest
data modify block ~ ~ ~ Items set from storage turtlecraft:tmp extra_items


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
data remove storage turtlecraft:tmp llama_items
data remove storage turtlecraft:tmp block_items
data remove storage turtlecraft:tmp extra_items
data remove storage turtlecraft:tmp this_slot
scoreboard players reset $block_slots turtlecraft.tmp
scoreboard players reset $llama_item_count turtlecraft.tmp
scoreboard players reset $llama_count_start turtlecraft.tmp
scoreboard players reset $block_item_count turtlecraft.tmp
scoreboard players reset $sound_played turtlecraft.tmp
