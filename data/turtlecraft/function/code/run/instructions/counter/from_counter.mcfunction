
# Get list
data modify storage turtlecraft:tmp counter_src set from entity @s ArmorItems[3].components."minecraft:custom_data".turtlecraft.Counters


# Iterate: for every counter in list, check if its name matches the one in run_line
execute store result score $src_index turtlecraft.tmp run data get storage turtlecraft:tmp counter_src
scoreboard players set $diff_name_src turtlecraft.tmp 1

execute if score $src_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/from_counter_name


# Get value from counter. If none was found, default to 0
execute if score $diff_name_src turtlecraft.tmp matches 1 run scoreboard players set $counter_operator turtlecraft.tmp 0
execute if score $diff_name_src turtlecraft.tmp matches 0 store result score $counter_operator turtlecraft.tmp run data get storage turtlecraft:tmp counter_src[-1].value


# Clear tmp
data remove storage turtlecraft:tmp counter_src
scoreboard players reset $src_index turtlecraft.tmp
scoreboard players reset $diff_name_src turtlecraft.tmp
