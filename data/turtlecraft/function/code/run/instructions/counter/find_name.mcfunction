
# Try to replace the name in saved counters with the name from run_line
execute store result score $different_name turtlecraft.tmp run data modify storage turtlecraft:tmp Counters[-1].name set from storage turtlecraft:tmp run_line.A.name


# If success, then the names were different. Keep searching
execute if score $different_name turtlecraft.tmp matches 1 run data remove storage turtlecraft:tmp Counters[-1]
execute if score $different_name turtlecraft.tmp matches 1 run scoreboard players remove $counter_index turtlecraft.tmp 1
execute if score $different_name turtlecraft.tmp matches 1 if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/find_name
