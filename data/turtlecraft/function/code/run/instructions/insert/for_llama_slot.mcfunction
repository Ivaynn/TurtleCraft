# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Check item id
execute if data storage turtlecraft:tmp {run_line:{A:{item:"all"}}} run scoreboard players set $different_id turtlecraft.tmp 0
data modify storage turtlecraft:tmp this_slot set from storage turtlecraft:tmp llama_items[0]
execute unless score $different_id turtlecraft.tmp matches 0 store success score $different_id turtlecraft.tmp run data modify storage turtlecraft:tmp this_slot.id set from storage turtlecraft:tmp run_line.A.item


# Don't allow shulker boxes inside other shulker boxes
execute if block ~ ~ ~ #minecraft:shulker_boxes run function turtlecraft:code/run/instructions/insert/shulker_box


# Insert items in slot
execute if score $different_id turtlecraft.tmp matches 1 run function turtlecraft:code/run/instructions/insert/keep_slot
execute if score $different_id turtlecraft.tmp matches 0 run function turtlecraft:code/run/instructions/insert/insert_slot
scoreboard players reset $different_id turtlecraft.tmp


# Iterate
data remove storage turtlecraft:tmp llama_items[0]
scoreboard players remove $llama_slots turtlecraft.tmp 1
execute if score $llama_slots turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/insert/for_llama_slot
