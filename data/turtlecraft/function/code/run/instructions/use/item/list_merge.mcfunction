data modify storage turtlecraft:tmp llama_items append from storage turtlecraft:tmp last_items[0]
data remove storage turtlecraft:tmp last_items[0]
scoreboard players remove $append_count turtlecraft.tmp 1
execute if score $append_count turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/use/item/list_merge