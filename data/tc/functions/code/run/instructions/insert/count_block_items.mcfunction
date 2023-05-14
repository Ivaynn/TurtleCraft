# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Move data to storage for performance
scoreboard players set $block_item_count tc.tmp 0
data modify storage tc:tmp block_items set from block ~ ~ ~ Items
execute store result score $block_slots tc.tmp run data get storage tc:tmp block_items


# Get total item count in score "$block_item_count tc.tmp"
function tc:code/run/instructions/insert/for_block_slot


# Clear tmp
scoreboard players reset $block_slots tc.tmp
scoreboard players reset $block_this_slot tc.tmp
