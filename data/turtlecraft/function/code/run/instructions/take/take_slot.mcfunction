# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Get total item count in llama ($llama_item_count turtlecraft.tmp)
function turtlecraft:code/run/instructions/take/count_llama_items
scoreboard players operation $llama_count_start turtlecraft.tmp = $llama_item_count turtlecraft.tmp


# Put all llama items in shulker box
setblock 10028 0 10028 minecraft:yellow_shulker_box
data modify block 10028 0 10028 Items set from entity @s Items
setblock 10028 1 10028 minecraft:yellow_shulker_box
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Insert items from this chest slot into shulker box
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stone",count:1b}]}
data modify block 10028 0 10028 Items[0] set from storage turtlecraft:tmp block_items[0]
loot insert 10028 1 10028 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Update llama items
loot replace entity @s horse.0 15 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Get new total item count in llama ($llama_item_count turtlecraft.tmp)
function turtlecraft:code/run/instructions/take/count_llama_items


# Play sound
execute if score $llama_item_count turtlecraft.tmp > $llama_count_start turtlecraft.tmp unless score $sound_played turtlecraft.tmp matches 1 unless score $silent turtlecraft.tmp matches 1 run playsound minecraft:entity.item.pickup neutral @a ~ ~ ~ 0.75 1.2
execute if score $llama_item_count turtlecraft.tmp > $llama_count_start turtlecraft.tmp run scoreboard players set $sound_played turtlecraft.tmp 1


# Put any extra items into a data storage
scoreboard players operation $llama_item_count turtlecraft.tmp -= $llama_count_start turtlecraft.tmp
execute store result score $block_item_count turtlecraft.tmp run data get storage turtlecraft:tmp block_items[0].count
scoreboard players operation $block_item_count turtlecraft.tmp -= $llama_item_count turtlecraft.tmp

execute store result storage turtlecraft:tmp block_items[0].count byte 1 run scoreboard players get $block_item_count turtlecraft.tmp
execute unless score $block_item_count turtlecraft.tmp matches 1.. run return run data remove storage turtlecraft:tmp block_items[0]
data modify storage turtlecraft:tmp extra_items append from storage turtlecraft:tmp block_items[0]
