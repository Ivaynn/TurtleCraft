# Executed by an item entity. All turtle entities have "tc.tmp"

# Check item id
execute if data storage tc:tmp {run_line:{A:{item:"all"}}} run scoreboard players set $different_id tc.tmp 0
data modify storage tc:tmp this_item set from entity @s Item
execute unless score $different_id tc.tmp matches 0 store success score $different_id tc.tmp run data modify storage tc:tmp this_item.id set from storage tc:tmp run_line.A.item


# Take items from slot
execute if score $different_id tc.tmp matches 0 run function tc:code/run/instructions/grab/grab_item
scoreboard players reset $different_id tc.tmp


# Clear tmp
fill 10028 1 10028 10028 0 10028 minecraft:bedrock
scoreboard players reset $dropped_count_start tc.tmp
scoreboard players reset $dropped_item_count tc.tmp
scoreboard players reset $llama_item_count tc.tmp
scoreboard players reset $llama_count_start tc.tmp
data remove storage tc:tmp dropped_item
data remove storage tc:tmp this_item
data remove storage tc:tmp llama_items
