# Executed by turtlecraft.body at mined block coordinates. All turtle entities have "turtlecraft.tmp"


# Create shulker with the inventory items
setblock 10028 1 10028 minecraft:yellow_shulker_box
data modify storage turtlecraft:tmp llama_items set from entity @s Items
data modify block 10028 1 10028 Items set from storage turtlecraft:tmp llama_items


# Transfer all items to a second shulker, that way they start at slot 0 (llama inventory start at slot 2 for some reason)
setblock 10028 0 10028 minecraft:yellow_shulker_box
loot insert 10028 0 10028 mine 10028 1 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Insert drops on chest
execute store result score $item_count turtlecraft.tmp run loot insert 10028 0 10028 mine ~ ~ ~ mainhand


# Transfer shulker items back to llama, now with mined item (and organised)
loot replace entity @s horse.0 15 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]


# Check if the llama items changed
execute store result score $success turtlecraft.tmp run data modify storage turtlecraft:tmp llama_items set from entity @s Items
execute if score $item_count turtlecraft.tmp matches 0 run scoreboard players set $success turtlecraft.tmp 1


# If llama items changed: break block
execute if score $success turtlecraft.tmp matches 1 run function turtlecraft:code/run/instructions/mine/break_block
# Else (llama items didn't change): inventory full
execute if score $success turtlecraft.tmp matches 0 run scoreboard players set @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.msg 1
#    If PauseOnError: don't break
#    Else: break block and drop items on the ground
execute if score $success turtlecraft.tmp matches 0 if score $error_pause turtlecraft.tmp matches 0 align xyz positioned ~0.5 ~0.5 ~0.5 run loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
execute if score $success turtlecraft.tmp matches 0 if score $error_pause turtlecraft.tmp matches 0 run function turtlecraft:code/run/instructions/mine/break_block


# Clear tmp
fill 10028 0 10028 10028 1 10028 minecraft:bedrock
data remove storage turtlecraft:tmp llama_items
scoreboard players reset $item_count turtlecraft.tmp
scoreboard players reset $success turtlecraft.tmp