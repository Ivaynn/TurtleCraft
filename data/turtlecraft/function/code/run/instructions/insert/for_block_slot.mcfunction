# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Add item count of this slot to total
execute store result score $block_this_slot turtlecraft.tmp run data get storage turtlecraft:tmp block_items[-1].count
scoreboard players operation $block_item_count turtlecraft.tmp += $block_this_slot turtlecraft.tmp


# Iterate
data remove storage turtlecraft:tmp block_items[-1]
scoreboard players remove $block_slots turtlecraft.tmp 1
execute if score $block_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/insert/for_block_slot
