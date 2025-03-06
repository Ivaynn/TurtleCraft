data remove storage turtlecraft:tmp last_items[0]
scoreboard players remove $item_index turtlecraft.tmp 1
execute if score $item_index turtlecraft.tmp matches 0.. run function turtlecraft:code/run/instructions/use/item/list_end