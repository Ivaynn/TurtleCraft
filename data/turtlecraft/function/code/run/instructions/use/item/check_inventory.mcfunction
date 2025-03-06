
# Check if ID can be replaced. If not, then it must be the same so the item was found
execute store success score $item_replaced turtlecraft.tmp run data modify storage turtlecraft:tmp llama_items[-1].id set from storage turtlecraft:tmp run_line.A.item


# Item found: use item and reduce count
execute if score $item_replaced turtlecraft.tmp matches 0 run function turtlecraft:code/run/instructions/use/item/item_list/usable
execute if score $item_replaced turtlecraft.tmp matches 0 if score $use_success turtlecraft.tmp matches 0 run function turtlecraft:code/run/instructions/use/item/item_list/placeable
execute if score $item_replaced turtlecraft.tmp matches 0 if score $use_success turtlecraft.tmp matches 1 run function turtlecraft:code/run/instructions/use/item/remove_one


# Item not found: iterate
execute if score $item_replaced turtlecraft.tmp matches 1 run data remove storage turtlecraft:tmp llama_items[-1]
execute if score $item_replaced turtlecraft.tmp matches 1 run scoreboard players remove $item_index turtlecraft.tmp 1
execute if score $item_replaced turtlecraft.tmp matches 1 if score $item_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/use/item/check_inventory
