# Executed by turtlecraft.body at block coordinates. All turtle entities have "turtlecraft.tmp"


# Effect
execute unless score $silent turtlecraft.tmp matches 1 run playsound block.dispenser.dispense neutral @a ~ ~ ~ 1 1.1


# If item is in inventory:
#     Try to use item
#     If item was used:
#         Reduce count by 1
#         Update inventory
scoreboard players set $use_success turtlecraft.tmp 0
function turtlecraft:code/run/instructions/use/item/check_inventory
execute at @s anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~0.5 ~0.5 run function turtlecraft:code/run/instructions/use/item/block_update


# Error messages
execute if score $item_replaced turtlecraft.tmp matches 1 run scoreboard players set @s turtlecraft.msg 5
execute if score $use_success turtlecraft.tmp matches 0 unless score @s turtlecraft.msg matches 1.. run scoreboard players set @s turtlecraft.msg 4


# Clear tmp
scoreboard players reset $use_success turtlecraft.tmp
scoreboard players reset $item_replaced turtlecraft.tmp
scoreboard players reset $append_count turtlecraft.tmp
scoreboard players reset $item_count turtlecraft.tmp
