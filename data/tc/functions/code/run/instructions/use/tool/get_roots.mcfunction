# Executed by tc.body at mined block coordinates. All turtle entities have "tc.tmp"


# Create shulker with the inventory items
setblock 10028 1 10028 minecraft:yellow_shulker_box
data modify storage tc:tmp llama_items set from entity @s Items
data modify block 10028 1 10028 Items set from storage tc:tmp llama_items


# Create a second shulker, insert items from llama into that shulker, add roots
setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:air{drop_contents:1b}
setblock 10028 1 10028 minecraft:bedrock
setblock 10028 1 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:hanging_roots",Count:1b}]}
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:air{drop_contents:1b}


# Transfer shulker items back to llama, now with roots
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:air{drop_contents:1b}


# If llama items didn't change, drop item
execute store result score $success tc.tmp run data modify storage tc:tmp llama_items set from entity @s Items
execute if score $success tc.tmp matches 0 align xyz run loot spawn ~0.5 ~0.5 ~0.5 mine 10028 1 10028 minecraft:air{drop_contents:1b}


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
data remove storage tc:tmp llama_items
scoreboard players reset $success tc.tmp
