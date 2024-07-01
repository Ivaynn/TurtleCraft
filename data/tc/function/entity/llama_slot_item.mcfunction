# Executed by every turtle llama EVERY TICK if there's a player nearby


# Try to replace the item in the decor slot
execute store success score $llama_item tc.tmp run data modify entity @s body_armor_item set from entity @s HandItems[0]
execute if score $llama_item tc.tmp matches 0 run return 1


# If the item was replaced, then it was not what it should be, clear all invalid items
execute as @e[type=minecraft:item,distance=..10] if data entity @s Item.components."minecraft:custom_data".tc.ClearItem run kill @s
