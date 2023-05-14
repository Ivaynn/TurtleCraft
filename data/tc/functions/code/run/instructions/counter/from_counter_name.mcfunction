
# Try to replace the name in saved counters with the value from run_line
execute store result score $diff_name_src tc.tmp run data modify storage tc:tmp counter_src[-1].name set from storage tc:tmp run_line.A.value


# If success, then the names were different. Keep searching
execute if score $diff_name_src tc.tmp matches 1 run data remove storage tc:tmp counter_src[-1]
execute if score $diff_name_src tc.tmp matches 1 run scoreboard players remove $src_index tc.tmp 1
execute if score $diff_name_src tc.tmp matches 1 if score $src_index tc.tmp matches 1.. run function tc:code/run/instructions/counter/from_counter_name
