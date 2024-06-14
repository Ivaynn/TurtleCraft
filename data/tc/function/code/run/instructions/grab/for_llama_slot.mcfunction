# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Add item count of this slot to total
execute store result score $llama_this_slot tc.tmp run data get storage tc:tmp llama_items[-1].Count
scoreboard players operation $llama_item_count tc.tmp += $llama_this_slot tc.tmp


# Iterate
data remove storage tc:tmp llama_items[-1]
scoreboard players remove $llama_slots tc.tmp 1
execute if score $llama_slots tc.tmp matches 1.. run function tc:code/run/instructions/grab/for_llama_slot
