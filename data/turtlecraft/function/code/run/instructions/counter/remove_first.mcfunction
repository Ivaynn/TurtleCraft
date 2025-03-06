
data remove storage turtlecraft:tmp list_end[0]
scoreboard players remove $counter_index turtlecraft.tmp 1
execute if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/remove_first
