# Executed by every turtle llama EVERY TICK if there's a player nearby


# Try to replace the item in the decor slot
execute store success score $llama_item turtlecraft.tmp run data modify entity @s equipment.body set from entity @s equipment.mainhand
execute if score $llama_item turtlecraft.tmp matches 0 run return 1


# If the item was replaced, then it was not what it should be, clear all invalid items
execute as @e[type=minecraft:item,distance=..10] if data entity @s Item.components."minecraft:custom_data".turtlecraft.ClearItem run kill @s
