
data modify storage tc:tmp Counters append from storage tc:tmp list_end[0]
data remove storage tc:tmp list_end[0]
scoreboard players remove $counter_merge tc.tmp 1
execute if score $counter_merge tc.tmp matches 1.. run function tc:code/run/instructions/counter/merge_list
