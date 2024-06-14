# Executed by tc.body. All turtle entities have "tc.tmp"


# Check item id
data modify storage tc:tmp this_slot set from storage tc:tmp llama_items[0]
execute unless score $different_id tc.tmp matches 0 if data storage tc:tmp {fuel_id:"any"} if data storage tc:tmp {this_slot:{id:"minecraft:coal"}} run scoreboard players set $different_id tc.tmp 0
execute unless score $different_id tc.tmp matches 0 if data storage tc:tmp {fuel_id:"any"} if data storage tc:tmp {this_slot:{id:"minecraft:charcoal"}} run scoreboard players set $different_id tc.tmp 0
execute unless score $different_id tc.tmp matches 0 if data storage tc:tmp {fuel_id:"any"} if data storage tc:tmp {this_slot:{id:"minecraft:coal_block"}} run scoreboard players set $different_id tc.tmp 0
execute unless score $different_id tc.tmp matches 0 if data storage tc:tmp {fuel_id:"any"} if data storage tc:tmp {this_slot:{id:"minecraft:blaze_rod"}} run scoreboard players set $different_id tc.tmp 0
execute unless score $different_id tc.tmp matches 0 store success score $different_id tc.tmp run data modify storage tc:tmp this_slot.id set from storage tc:tmp fuel_id

execute unless score $fuel_count tc.tmp matches 1.. run scoreboard players set $different_id tc.tmp 1


# Consume fuel
execute if score $different_id tc.tmp matches 1 run function tc:code/run/instructions/fuel/keep_slot
execute if score $different_id tc.tmp matches 0 run function tc:code/run/instructions/fuel/consume_slot
scoreboard players reset $different_id tc.tmp


# Iterate
data remove storage tc:tmp llama_items[0]
scoreboard players remove $llama_slots tc.tmp 1
execute if score $llama_slots tc.tmp matches 1.. run function tc:code/run/instructions/fuel/for_slot
