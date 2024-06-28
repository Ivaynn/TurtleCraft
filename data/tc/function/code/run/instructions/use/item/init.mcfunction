# Executed by tc.body at block coordinates. All turtle entities have "tc.tmp"


# Effect
execute unless score $silent tc.tmp matches 1 run playsound block.dispenser.dispense neutral @a ~ ~ ~ 1 1.1


# If item is in inventory:
#     Try to use item
#     If item was used:
#         Reduce count by 1
#         Update inventory
scoreboard players set $use_success tc.tmp 0
function tc:code/run/instructions/use/item/check_inventory
execute at @s anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~0.5 ~0.5 run function tc:code/run/instructions/use/item/block_update


# Error messages
execute if score $item_replaced tc.tmp matches 1 run scoreboard players set @s tc.msg 5
execute if score $use_success tc.tmp matches 0 unless score @s tc.msg matches 1.. run scoreboard players set @s tc.msg 4


# Clear tmp
scoreboard players reset $use_success tc.tmp
scoreboard players reset $item_replaced tc.tmp
scoreboard players reset $append_count tc.tmp
scoreboard players reset $item_count tc.tmp
