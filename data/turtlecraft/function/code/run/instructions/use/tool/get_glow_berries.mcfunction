# Executed by turtlecraft.body at mined block coordinates. All turtle entities have "turtlecraft.tmp"


# Replace vines (keep original age)
execute if block ~ ~ ~ minecraft:cave_vines_plant run setblock ~ ~ ~ minecraft:cave_vines_plant[berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=0] run setblock ~ ~ ~ minecraft:cave_vines[age=0,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=1] run setblock ~ ~ ~ minecraft:cave_vines[age=1,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=2] run setblock ~ ~ ~ minecraft:cave_vines[age=2,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=3] run setblock ~ ~ ~ minecraft:cave_vines[age=3,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=4] run setblock ~ ~ ~ minecraft:cave_vines[age=4,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=5] run setblock ~ ~ ~ minecraft:cave_vines[age=5,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=6] run setblock ~ ~ ~ minecraft:cave_vines[age=6,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=7] run setblock ~ ~ ~ minecraft:cave_vines[age=7,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=8] run setblock ~ ~ ~ minecraft:cave_vines[age=8,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=9] run setblock ~ ~ ~ minecraft:cave_vines[age=9,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=10] run setblock ~ ~ ~ minecraft:cave_vines[age=10,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=11] run setblock ~ ~ ~ minecraft:cave_vines[age=11,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=12] run setblock ~ ~ ~ minecraft:cave_vines[age=12,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=13] run setblock ~ ~ ~ minecraft:cave_vines[age=13,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=14] run setblock ~ ~ ~ minecraft:cave_vines[age=14,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=15] run setblock ~ ~ ~ minecraft:cave_vines[age=15,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=16] run setblock ~ ~ ~ minecraft:cave_vines[age=16,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=17] run setblock ~ ~ ~ minecraft:cave_vines[age=17,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=18] run setblock ~ ~ ~ minecraft:cave_vines[age=18,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=19] run setblock ~ ~ ~ minecraft:cave_vines[age=19,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=20] run setblock ~ ~ ~ minecraft:cave_vines[age=20,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=21] run setblock ~ ~ ~ minecraft:cave_vines[age=21,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=22] run setblock ~ ~ ~ minecraft:cave_vines[age=22,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=23] run setblock ~ ~ ~ minecraft:cave_vines[age=23,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=24] run setblock ~ ~ ~ minecraft:cave_vines[age=24,berries=false]
execute if block ~ ~ ~ minecraft:cave_vines[age=25] run setblock ~ ~ ~ minecraft:cave_vines[age=25,berries=false]


# Create shulker with the inventory items
setblock 10028 1 10028 minecraft:yellow_shulker_box
data modify storage turtlecraft:tmp llama_items set from entity @s Items
data modify block 10028 1 10028 Items set from storage turtlecraft:tmp llama_items


# Create a second shulker, insert items from llama into that shulker, add berries
setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:glow_berries",count:1b}]}
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Transfer shulker items back to llama, now with berries
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# If llama items didn't change, drop item
execute store result score $success turtlecraft.tmp run data modify storage turtlecraft:tmp llama_items set from entity @s Items
execute if score $success turtlecraft.tmp matches 0 align xyz run loot spawn ~0.5 ~0.5 ~0.5 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
data remove storage turtlecraft:tmp llama_items
scoreboard players reset $success turtlecraft.tmp