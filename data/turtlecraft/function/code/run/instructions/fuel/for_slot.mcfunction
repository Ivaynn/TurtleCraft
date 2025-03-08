# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"


# Check item id
data modify storage turtlecraft:tmp this_slot set from storage turtlecraft:tmp llama_items[0]
execute unless score $different_id turtlecraft.tmp matches 0 if data storage turtlecraft:tmp {fuel_id:"any"} if data storage turtlecraft:tmp {this_slot:{id:"minecraft:coal"}} run scoreboard players set $different_id turtlecraft.tmp 0
execute unless score $different_id turtlecraft.tmp matches 0 if data storage turtlecraft:tmp {fuel_id:"any"} if data storage turtlecraft:tmp {this_slot:{id:"minecraft:charcoal"}} run scoreboard players set $different_id turtlecraft.tmp 0
execute unless score $different_id turtlecraft.tmp matches 0 if data storage turtlecraft:tmp {fuel_id:"any"} if data storage turtlecraft:tmp {this_slot:{id:"minecraft:coal_block"}} run scoreboard players set $different_id turtlecraft.tmp 0
execute unless score $different_id turtlecraft.tmp matches 0 if data storage turtlecraft:tmp {fuel_id:"any"} if data storage turtlecraft:tmp {this_slot:{id:"minecraft:blaze_rod"}} run scoreboard players set $different_id turtlecraft.tmp 0
execute unless score $different_id turtlecraft.tmp matches 0 if data storage turtlecraft:tmp {fuel_id:"any"} if data storage turtlecraft:tmp {this_slot:{id:"minecraft:lava_bucket"}} run scoreboard players set $different_id turtlecraft.tmp 0
execute unless score $different_id turtlecraft.tmp matches 0 store success score $different_id turtlecraft.tmp run data modify storage turtlecraft:tmp this_slot.id set from storage turtlecraft:tmp fuel_id

execute unless score $fuel_count turtlecraft.tmp matches 1.. run scoreboard players set $different_id turtlecraft.tmp 1


# Consume fuel
execute if score $different_id turtlecraft.tmp matches 1 run function turtlecraft:code/run/instructions/fuel/keep_slot
execute if score $different_id turtlecraft.tmp matches 0 run function turtlecraft:code/run/instructions/fuel/consume_slot
scoreboard players reset $different_id turtlecraft.tmp


# Iterate
data remove storage turtlecraft:tmp llama_items[0]
scoreboard players remove $llama_slots turtlecraft.tmp 1
execute if score $llama_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/fuel/for_slot
