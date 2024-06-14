# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Add item count of this slot to total
execute store result score $block_this_slot tc.tmp run data get storage tc:tmp block_items[-1].Count
scoreboard players operation $block_item_count tc.tmp += $block_this_slot tc.tmp


# Iterate
data remove storage tc:tmp block_items[-1]
scoreboard players remove $block_slots tc.tmp 1
execute if score $block_slots tc.tmp matches 1.. run function tc:code/run/instructions/insert/for_block_slot
