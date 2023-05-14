
# Try to replace the name in saved counters with the name from run_line
execute store result score $different_name tc.tmp run data modify storage tc:tmp Counters[-1].name set from storage tc:tmp run_line.A.name


# If success, then the names were different. Keep searching
execute if score $different_name tc.tmp matches 1 run data remove storage tc:tmp Counters[-1]
execute if score $different_name tc.tmp matches 1 run scoreboard players remove $counter_index tc.tmp 1
execute if score $different_name tc.tmp matches 1 if score $counter_index tc.tmp matches 1.. run function tc:code/run/instructions/counter/find_name
