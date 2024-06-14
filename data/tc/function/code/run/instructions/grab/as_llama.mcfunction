# Executed by tc.body. All turtle entities have "tc.tmp"


# Get total item count in llama ($llama_item_count tc.tmp)
function tc:code/run/instructions/grab/count_llama_items
scoreboard players operation $llama_count_start tc.tmp = $llama_item_count tc.tmp


# Put all llama items in shulker box
setblock 10028 0 10028 minecraft:yellow_shulker_box
data modify block 10028 0 10028 Items set from entity @s Items
setblock 10028 1 10028 minecraft:yellow_shulker_box
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:air{drop_contents:1b}


# Insert item into shulker box
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",Count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage tc:tmp dropped_item
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:air{drop_contents:1b}


# Update llama items
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:air{drop_contents:1b}


# Get new total item count in llama ($llama_item_count tc.tmp)
function tc:code/run/instructions/grab/count_llama_items


# Leave any extra items in entity form
scoreboard players operation $llama_item_count tc.tmp -= $llama_count_start tc.tmp
execute store result score $dropped_item_count tc.tmp run data get storage tc:tmp dropped_item.Count
scoreboard players operation $dropped_item_count tc.tmp -= $llama_item_count tc.tmp
