# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"

execute if score $chunk_loaded tc.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded tc.tmp 0
execute if score $chunk_loaded tc.tmp matches 0 run return 0

# Init
data modify storage tc:tmp llama_items set from entity @s Items
data modify storage tc:tmp last_items set from storage tc:tmp llama_items

execute store result score $item_index tc.tmp run data get storage tc:tmp llama_items


# Get hand item
execute if data storage tc:tmp {run_line:{A:{item:"tool"}}} run scoreboard players set $item_index tc.tmp -1
execute if data storage tc:tmp {run_line:{A:{item:"tool"}}} run data modify storage tc:tmp run_line.A.item set from entity @s HandItems[0].id


# Tool
execute if score $item_index tc.tmp matches -1 run function tc:code/run/instructions/use/tool/init


# Use item
execute if score $item_index tc.tmp matches 1.. run function tc:code/run/instructions/use/item/init


# Error message
execute if score $item_index tc.tmp matches 0 unless score @s tc.msg matches 1.. run scoreboard players set @s tc.msg 5


# Clear tmp
scoreboard players reset $item_index tc.tmp
data remove storage tc:tmp llama_items
data remove storage tc:tmp last_items
