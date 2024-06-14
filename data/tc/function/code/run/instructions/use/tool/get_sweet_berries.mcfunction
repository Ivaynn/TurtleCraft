# Executed by tc.body at mined block coordinates. All turtle entities have "tc.tmp"


# Get berries count (1-2 for age=2, 2-3 for age=3)
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=2] run scoreboard players set $berry_count tc.tmp 1
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=3] run scoreboard players set $berry_count tc.tmp 2
execute if predicate tc:random_50 run scoreboard players add $berry_count tc.tmp 1
setblock ~ ~ ~ minecraft:sweet_berry_bush[age=1]


# Create shulker with the inventory items
setblock 10028 1 10028 minecraft:yellow_shulker_box
data modify storage tc:tmp llama_items set from entity @s Items
data modify block 10028 1 10028 Items set from storage tc:tmp llama_items


# Create a second shulker, insert items from llama into that shulker, add berries
setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:sweet_berries",Count:1b}]}
execute store result block 10028 1 10028 Items[0].Count byte 1 run scoreboard players get $berry_count tc.tmp
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Transfer shulker items back to llama, now with berries
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# If llama items didn't change, drop item
execute store result score $success tc.tmp run data modify storage tc:tmp llama_items set from entity @s Items
execute if score $success tc.tmp matches 0 align xyz run loot spawn ~0.5 ~0.5 ~0.5 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
data remove storage tc:tmp llama_items
scoreboard players reset $berry_count tc.tmp
scoreboard players reset $success tc.tmp