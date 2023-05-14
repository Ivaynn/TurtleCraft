
data remove storage tc:tmp list_end[0]
scoreboard players remove $counter_index tc.tmp 1
execute if score $counter_index tc.tmp matches 1.. run function tc:code/run/instructions/counter/remove_first
