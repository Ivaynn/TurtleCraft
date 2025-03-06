# Executed by an item entity. All turtle entities have "turtlecraft.tmp"

# Check item id
execute if data storage turtlecraft:tmp {run_line:{A:{item:"all"}}} run scoreboard players set $different_id turtlecraft.tmp 0
data modify storage turtlecraft:tmp this_item set from entity @s Item
execute unless score $different_id turtlecraft.tmp matches 0 store success score $different_id turtlecraft.tmp run data modify storage turtlecraft:tmp this_item.id set from storage turtlecraft:tmp run_line.A.item


# Take items from slot
execute if score $different_id turtlecraft.tmp matches 0 run function turtlecraft:code/run/instructions/grab/grab_item
scoreboard players reset $different_id turtlecraft.tmp


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
scoreboard players reset $dropped_count_start turtlecraft.tmp
scoreboard players reset $dropped_item_count turtlecraft.tmp
scoreboard players reset $llama_item_count turtlecraft.tmp
scoreboard players reset $llama_count_start turtlecraft.tmp
data remove storage turtlecraft:tmp dropped_item
data remove storage turtlecraft:tmp this_item
data remove storage turtlecraft:tmp llama_items
