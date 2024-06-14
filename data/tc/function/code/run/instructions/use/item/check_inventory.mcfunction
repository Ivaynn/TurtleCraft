
# Check if ID can be replaced. If not, then it must be the same so the item was found
execute store success score $item_replaced tc.tmp run data modify storage tc:tmp llama_items[-1].id set from storage tc:tmp run_line.A.item


# Item found: use item and reduce count
execute if score $item_replaced tc.tmp matches 0 run function tc:code/run/instructions/use/item/item_list/usable
execute if score $item_replaced tc.tmp matches 0 if score $use_success tc.tmp matches 0 run function tc:code/run/instructions/use/item/item_list/placeable
execute if score $item_replaced tc.tmp matches 0 if score $use_success tc.tmp matches 1 run function tc:code/run/instructions/use/item/remove_one


# Item not found: iterate
execute if score $item_replaced tc.tmp matches 1 run data remove storage tc:tmp llama_items[-1]
execute if score $item_replaced tc.tmp matches 1 run scoreboard players remove $item_index tc.tmp 1
execute if score $item_replaced tc.tmp matches 1 if score $item_index tc.tmp matches 1.. run function tc:code/run/instructions/use/item/check_inventory
