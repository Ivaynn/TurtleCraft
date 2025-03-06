
# Try to replace the name in saved counters with the value from run_line
execute store result score $diff_name_src turtlecraft.tmp run data modify storage turtlecraft:tmp counter_src[-1].name set from storage turtlecraft:tmp run_line.A.value


# If success, then the names were different. Keep searching
execute if score $diff_name_src turtlecraft.tmp matches 1 run data remove storage turtlecraft:tmp counter_src[-1]
execute if score $diff_name_src turtlecraft.tmp matches 1 run scoreboard players remove $src_index turtlecraft.tmp 1
execute if score $diff_name_src turtlecraft.tmp matches 1 if score $src_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/from_counter_name
