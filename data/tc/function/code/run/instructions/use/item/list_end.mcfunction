data remove storage tc:tmp last_items[0]
scoreboard players remove $item_index tc.tmp 1
execute if score $item_index tc.tmp matches 0.. run function tc:code/run/instructions/use/item/list_end