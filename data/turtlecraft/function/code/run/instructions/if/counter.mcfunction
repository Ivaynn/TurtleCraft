# Executed by turtlecraft.body - all attached entities have "turtlecraft.tmp"
# Called by code/run - all relevant data is already in storages

scoreboard players set $if_success turtlecraft.tmp 0


## GET VALUE
# Get list of counters
data modify storage turtlecraft:tmp Counters set from entity @s equipment.head.components."minecraft:custom_data".turtlecraft.Counters


# Iterate: for every counter in list, check if its name matches the one in run_line
execute store result score $counter_index turtlecraft.tmp run data get storage turtlecraft:tmp Counters
scoreboard players set $different_name turtlecraft.tmp 1

execute if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/find_name


# Get value from counter. If none was found, default to 0
execute if score $different_name turtlecraft.tmp matches 1 run scoreboard players set $counter_value turtlecraft.tmp 0
execute if score $different_name turtlecraft.tmp matches 0 store result score $counter_value turtlecraft.tmp run data get storage turtlecraft:tmp Counters[-1].value





## COMPARE VALUE
execute if data storage turtlecraft:tmp {run_line:{A:{type:"value"}}} store result score $counter_operator turtlecraft.tmp run data get storage turtlecraft:tmp run_line.A.value
execute if data storage turtlecraft:tmp {run_line:{A:{type:"counter"}}} run function turtlecraft:code/run/instructions/counter/from_counter


# Operation
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"="}}} if score $counter_value turtlecraft.tmp = $counter_operator turtlecraft.tmp run scoreboard players set $if_success turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"<"}}} if score $counter_value turtlecraft.tmp < $counter_operator turtlecraft.tmp run scoreboard players set $if_success turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"<="}}} if score $counter_value turtlecraft.tmp <= $counter_operator turtlecraft.tmp run scoreboard players set $if_success turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {run_line:{A:{operation:">"}}} if score $counter_value turtlecraft.tmp > $counter_operator turtlecraft.tmp run scoreboard players set $if_success turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {run_line:{A:{operation:">="}}} if score $counter_value turtlecraft.tmp >= $counter_operator turtlecraft.tmp run scoreboard players set $if_success turtlecraft.tmp 1





## Clear tmp
data remove storage turtlecraft:tmp Counters
scoreboard players reset $counter_index turtlecraft.tmp
scoreboard players reset $different_name turtlecraft.tmp
scoreboard players reset $counter_value turtlecraft.tmp
scoreboard players reset $counter_operator turtlecraft.tmp
