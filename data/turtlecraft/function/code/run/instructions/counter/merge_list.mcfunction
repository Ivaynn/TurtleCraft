
data modify storage turtlecraft:tmp Counters append from storage turtlecraft:tmp list_end[0]
data remove storage turtlecraft:tmp list_end[0]
scoreboard players remove $counter_merge turtlecraft.tmp 1
execute if score $counter_merge turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/merge_list
