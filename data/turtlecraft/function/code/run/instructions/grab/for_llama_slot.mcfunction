# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Add item count of this slot to total
execute store result score $llama_this_slot turtlecraft.tmp run data get storage turtlecraft:tmp llama_items[-1].count
scoreboard players operation $llama_item_count turtlecraft.tmp += $llama_this_slot turtlecraft.tmp


# Iterate
data remove storage turtlecraft:tmp llama_items[-1]
scoreboard players remove $llama_slots turtlecraft.tmp 1
execute if score $llama_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/grab/for_llama_slot
