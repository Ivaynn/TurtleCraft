# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Apply item nbt to block (shulker items, banner patters, bees, ...)
execute if data storage turtlecraft:tmp llama_items[-1].components run function turtlecraft:code/run/instructions/use/item/block_entity_tag


# Reduce count by 1
execute store result score $item_count turtlecraft.tmp run data get storage turtlecraft:tmp llama_items[-1].count
scoreboard players remove $item_count turtlecraft.tmp 1
execute store result storage turtlecraft:tmp llama_items[-1].count byte 1 run scoreboard players get $item_count turtlecraft.tmp
execute unless score $item_count turtlecraft.tmp matches 1.. run data remove storage turtlecraft:tmp llama_items[-1]


# Get inventory after item
scoreboard players remove $item_index turtlecraft.tmp 1
function turtlecraft:code/run/instructions/use/item/list_end


# Merge inventory before and after item
execute store result score $append_count turtlecraft.tmp run data get storage turtlecraft:tmp last_items
function turtlecraft:code/run/instructions/use/item/list_merge


# Give items back to llama
setblock 10028 1 10028 minecraft:yellow_shulker_box
data modify block 10028 1 10028 Items set from storage turtlecraft:tmp llama_items

setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]

# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock