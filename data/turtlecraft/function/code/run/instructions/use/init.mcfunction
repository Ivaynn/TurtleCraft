# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"

execute if score $chunk_loaded turtlecraft.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded turtlecraft.tmp 0
execute if score $chunk_loaded turtlecraft.tmp matches 0 run return 0

# Init
data modify storage turtlecraft:tmp llama_items set from entity @s Items
data modify storage turtlecraft:tmp last_items set from storage turtlecraft:tmp llama_items

execute store result score $item_index turtlecraft.tmp run data get storage turtlecraft:tmp llama_items


# Get hand item
execute if data storage turtlecraft:tmp {run_line:{A:{item:"tool"}}} run scoreboard players set $item_index turtlecraft.tmp -1
execute if data storage turtlecraft:tmp {run_line:{A:{item:"tool"}}} run data modify storage turtlecraft:tmp run_line.A.item set from entity @s equipment.mainhand.id


# Tool
execute if score $item_index turtlecraft.tmp matches -1 run function turtlecraft:code/run/instructions/use/tool/init


# Use item
execute if score $item_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/use/item/init


# Error message
execute if score $item_index turtlecraft.tmp matches 0 unless score @s turtlecraft.msg matches 1.. run scoreboard players set @s turtlecraft.msg 5


# Clear tmp
scoreboard players reset $item_index turtlecraft.tmp
data remove storage turtlecraft:tmp llama_items
data remove storage turtlecraft:tmp last_items
