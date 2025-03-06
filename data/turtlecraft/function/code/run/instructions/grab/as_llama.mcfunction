# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"


# Get total item count in llama ($llama_item_count turtlecraft.tmp)
function turtlecraft:code/run/instructions/grab/count_llama_items
scoreboard players operation $llama_count_start turtlecraft.tmp = $llama_item_count turtlecraft.tmp


# Put all llama items in shulker box
setblock 10028 0 10028 minecraft:yellow_shulker_box
data modify block 10028 0 10028 Items set from entity @s Items
setblock 10028 1 10028 minecraft:yellow_shulker_box
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Insert item into shulker box
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp dropped_item
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Update llama items
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Get new total item count in llama ($llama_item_count turtlecraft.tmp)
function turtlecraft:code/run/instructions/grab/count_llama_items


# Leave any extra items in entity form
scoreboard players operation $llama_item_count turtlecraft.tmp -= $llama_count_start turtlecraft.tmp
execute store result score $dropped_item_count turtlecraft.tmp run data get storage turtlecraft:tmp dropped_item.count
scoreboard players operation $dropped_item_count turtlecraft.tmp -= $llama_item_count turtlecraft.tmp
