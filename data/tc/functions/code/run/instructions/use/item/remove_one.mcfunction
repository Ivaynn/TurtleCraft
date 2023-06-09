# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Apply item nbt to block (shulker items, banner patters, bees, ...)
execute if data storage tc:tmp llama_items[-1].tag run function tc:code/run/instructions/use/item/block_entity_tag


# Reduce count by 1
execute store result score $item_count tc.tmp run data get storage tc:tmp llama_items[-1].Count
scoreboard players remove $item_count tc.tmp 1
execute store result storage tc:tmp llama_items[-1].Count byte 1 run scoreboard players get $item_count tc.tmp


# Get inventory after item
scoreboard players remove $item_index tc.tmp 1
function tc:code/run/instructions/use/item/list_end


# Merge inventory before and after item
execute store result score $append_count tc.tmp run data get storage tc:tmp last_items
function tc:code/run/instructions/use/item/list_merge


# Give items back to llama
setblock 10028 1 10028 minecraft:yellow_shulker_box
data modify block 10028 1 10028 Items set from storage tc:tmp llama_items

setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:air{drop_contents:1b}
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:air{drop_contents:1b}

# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock