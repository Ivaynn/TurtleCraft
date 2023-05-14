# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Check item id
execute if data storage tc:tmp {run_line:{A:{item:"all"}}} run scoreboard players set $different_id tc.tmp 0
data modify storage tc:tmp this_slot set from storage tc:tmp llama_items[0]
execute unless score $different_id tc.tmp matches 0 store success score $different_id tc.tmp run data modify storage tc:tmp this_slot.id set from storage tc:tmp run_line.A.item


# Drop item
execute if score $different_id tc.tmp matches 1 run function tc:code/run/instructions/drop/keep_slot
execute if score $different_id tc.tmp matches 0 run function tc:code/run/instructions/drop/drop_slot
scoreboard players reset $different_id tc.tmp


# Iterate
data remove storage tc:tmp llama_items[0]
scoreboard players remove $llama_slots tc.tmp 1
execute if score $llama_slots tc.tmp matches 1.. run function tc:code/run/instructions/drop/for_llama_slot
