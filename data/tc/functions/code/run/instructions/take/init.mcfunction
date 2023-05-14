# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


data modify storage tc:tmp block_items set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items
execute store result score $block_slots tc.tmp run data get storage tc:tmp block_items

setblock 10028 1 10028 minecraft:yellow_shulker_box
execute if score $block_slots tc.tmp matches 1.. run function tc:code/run/instructions/take/for_block_slot


# Put extra items back into chest
data modify block ~ ~ ~ Items set from storage tc:tmp extra_items


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp llama_items
data remove storage tc:tmp block_items
data remove storage tc:tmp extra_items
data remove storage tc:tmp this_slot
scoreboard players reset $block_slots tc.tmp
scoreboard players reset $llama_item_count tc.tmp
scoreboard players reset $llama_count_start tc.tmp
scoreboard players reset $block_item_count tc.tmp
scoreboard players reset $sound_played tc.tmp
