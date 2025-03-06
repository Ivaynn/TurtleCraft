# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Get total item count in block ($block_item_count turtlecraft.tmp)
function turtlecraft:code/run/instructions/insert/count_block_items
scoreboard players operation $block_count_start turtlecraft.tmp = $block_item_count turtlecraft.tmp


# Insert items from this slot
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp llama_items[0]
loot insert ~ ~ ~ mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Get new total item count in block ($block_item_count turtlecraft.tmp)
function turtlecraft:code/run/instructions/insert/count_block_items


# Play sound
execute if score $block_item_count turtlecraft.tmp > $block_count_start turtlecraft.tmp unless score $sound_played turtlecraft.tmp matches 1 unless score $silent turtlecraft.tmp matches 1 run playsound minecraft:block.dispenser.dispense neutral @a ~ ~ ~ 1 1.5
execute if score $block_item_count turtlecraft.tmp > $block_count_start turtlecraft.tmp run scoreboard players set $sound_played turtlecraft.tmp 1


# Put any extra items into the second shulker
scoreboard players operation $block_item_count turtlecraft.tmp -= $block_count_start turtlecraft.tmp
execute store result score $llama_item_count turtlecraft.tmp run data get storage turtlecraft:tmp llama_items[0].count

scoreboard players operation $llama_item_count turtlecraft.tmp -= $block_item_count turtlecraft.tmp
execute store result block 10028 0 10028 Items[0].count byte 1 run scoreboard players get $llama_item_count turtlecraft.tmp
execute unless score $llama_item_count turtlecraft.tmp matches 1.. run return run data remove block 10028 0 10028 Items[0]
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
