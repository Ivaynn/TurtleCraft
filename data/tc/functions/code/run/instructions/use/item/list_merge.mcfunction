data modify storage tc:tmp llama_items append from storage tc:tmp last_items[0]
data remove storage tc:tmp last_items[0]
scoreboard players remove $append_count tc.tmp 1
execute if score $append_count tc.tmp matches 1.. run function tc:code/run/instructions/use/item/list_merge