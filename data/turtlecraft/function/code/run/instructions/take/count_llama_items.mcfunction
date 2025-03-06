# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Move data to storage for performance
scoreboard players set $llama_item_count turtlecraft.tmp 0
data modify storage turtlecraft:tmp llama_items set from entity @s Items
execute store result score $llama_slots turtlecraft.tmp run data get storage turtlecraft:tmp llama_items


# Get total item count in score "$llama_item_count turtlecraft.tmp"
function turtlecraft:code/run/instructions/take/for_llama_slot


# Clear tmp
scoreboard players reset $llama_slots turtlecraft.tmp
scoreboard players reset $llama_this_slot turtlecraft.tmp
