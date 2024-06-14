# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Get total item count in llama ($llama_item_count tc.tmp)
function tc:code/run/instructions/take/count_llama_items
scoreboard players operation $llama_count_start tc.tmp = $llama_item_count tc.tmp


# Put all llama items in shulker box
setblock 10028 0 10028 minecraft:yellow_shulker_box
data modify block 10028 0 10028 Items set from entity @s Items
setblock 10028 1 10028 minecraft:yellow_shulker_box
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:air{drop_contents:1b}


# Insert items from this chest slot into shulker box
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",Count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage tc:tmp block_items[0]
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:air{drop_contents:1b}


# Update llama items
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:air{drop_contents:1b}


# Get new total item count in llama ($llama_item_count tc.tmp)
function tc:code/run/instructions/take/count_llama_items


# Play sound
execute if score $llama_item_count tc.tmp > $llama_count_start tc.tmp unless score $sound_played tc.tmp matches 1 run playsound minecraft:entity.item.pickup neutral @a ~ ~ ~ 0.75 1.2
execute if score $llama_item_count tc.tmp > $llama_count_start tc.tmp run scoreboard players set $sound_played tc.tmp 1


# Put any extra items into a data storage
scoreboard players operation $llama_item_count tc.tmp -= $llama_count_start tc.tmp
execute store result score $block_item_count tc.tmp run data get storage tc:tmp block_items[0].Count
scoreboard players operation $block_item_count tc.tmp -= $llama_item_count tc.tmp

execute store result storage tc:tmp block_items[0].Count byte 1 run scoreboard players get $block_item_count tc.tmp
data modify storage tc:tmp extra_items append from storage tc:tmp block_items[0]
