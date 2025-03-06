# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Move data to storage for performance
scoreboard players set $block_item_count turtlecraft.tmp 0
data modify storage turtlecraft:tmp block_items set from block ~ ~ ~ Items
execute store result score $block_slots turtlecraft.tmp run data get storage turtlecraft:tmp block_items


# Get total item count in score "$block_item_count turtlecraft.tmp"
function turtlecraft:code/run/instructions/insert/for_block_slot


# Clear tmp
scoreboard players reset $block_slots turtlecraft.tmp
scoreboard players reset $block_this_slot turtlecraft.tmp
