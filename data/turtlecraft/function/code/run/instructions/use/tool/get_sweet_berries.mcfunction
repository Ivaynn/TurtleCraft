# Executed by turtlecraft.body at mined block coordinates. All turtle entities have "turtlecraft.tmp"


# Get berries count (1-2 for age=2, 2-3 for age=3)
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=2] run scoreboard players set $berry_count turtlecraft.tmp 1
execute if block ~ ~ ~ minecraft:sweet_berry_bush[age=3] run scoreboard players set $berry_count turtlecraft.tmp 2
execute if predicate turtlecraft:random_50 run scoreboard players add $berry_count turtlecraft.tmp 1
setblock ~ ~ ~ minecraft:sweet_berry_bush[age=1]


# Create shulker with the inventory items
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[]}
data modify storage turtlecraft:tmp llama_items set from entity @s Items
data modify block 10028 1 10028 Items set from storage turtlecraft:tmp llama_items


# Create a second shulker, insert items from llama into that shulker, add berries
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[]}
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:sweet_berries",count:1b}]}
execute store result block 10028 1 10028 Items[0].count byte 1 run scoreboard players get $berry_count turtlecraft.tmp
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Transfer shulker items back to llama, now with berries
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# If llama items didn't change, drop item
execute store result score $success turtlecraft.tmp run data modify storage turtlecraft:tmp llama_items set from entity @s Items
execute if score $success turtlecraft.tmp matches 0 align xyz run loot spawn ~0.5 ~0.5 ~0.5 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
data remove storage turtlecraft:tmp llama_items
scoreboard players reset $berry_count turtlecraft.tmp
scoreboard players reset $success turtlecraft.tmp