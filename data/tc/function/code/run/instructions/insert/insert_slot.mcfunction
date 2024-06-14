# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Get total item count in block ($block_item_count tc.tmp)
function tc:code/run/instructions/insert/count_block_items
scoreboard players operation $block_count_start tc.tmp = $block_item_count tc.tmp


# Insert items from this slot
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",Count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage tc:tmp llama_items[0]
loot insert ~ ~ ~ mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Get new total item count in block ($block_item_count tc.tmp)
function tc:code/run/instructions/insert/count_block_items


# Play sound
execute if score $block_item_count tc.tmp > $block_count_start tc.tmp unless score $sound_played tc.tmp matches 1 run playsound minecraft:block.dispenser.dispense neutral @a ~ ~ ~ 1 1.5
execute if score $block_item_count tc.tmp > $block_count_start tc.tmp run scoreboard players set $sound_played tc.tmp 1


# Put any extra items into the second shulker
scoreboard players operation $block_item_count tc.tmp -= $block_count_start tc.tmp
execute store result score $llama_item_count tc.tmp run data get storage tc:tmp llama_items[0].Count

scoreboard players operation $llama_item_count tc.tmp -= $block_item_count tc.tmp
execute store result block 10028 0 10028 Items[0].Count byte 1 run scoreboard players get $llama_item_count tc.tmp
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
