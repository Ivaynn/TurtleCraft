# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Move data to storage for performance
scoreboard players set $llama_item_count tc.tmp 0
data modify storage tc:tmp llama_items set from entity @s Items
execute store result score $llama_slots tc.tmp run data get storage tc:tmp llama_items


# Get total item count in score "$llama_item_count tc.tmp"
function tc:code/run/instructions/take/for_llama_slot


# Clear tmp
scoreboard players reset $llama_slots tc.tmp
scoreboard players reset $llama_this_slot tc.tmp
