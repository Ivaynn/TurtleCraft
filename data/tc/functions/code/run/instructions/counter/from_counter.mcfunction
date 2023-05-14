
# Get list
data modify storage tc:tmp counter_src set from entity @s ArmorItems[3].tag.Counters


# Iterate: for every counter in list, check if its name matches the one in run_line
execute store result score $src_index tc.tmp run data get storage tc:tmp counter_src
scoreboard players set $diff_name_src tc.tmp 1

execute if score $src_index tc.tmp matches 1.. run function tc:code/run/instructions/counter/from_counter_name


# Get value from counter. If none was found, default to 0
execute if score $diff_name_src tc.tmp matches 1 run scoreboard players set $counter_operator tc.tmp 0
execute if score $diff_name_src tc.tmp matches 0 store result score $counter_operator tc.tmp run data get storage tc:tmp counter_src[-1].value


# Clear tmp
data remove storage tc:tmp counter_src
scoreboard players reset $src_index tc.tmp
scoreboard players reset $diff_name_src tc.tmp
