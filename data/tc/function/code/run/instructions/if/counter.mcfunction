# Executed by tc.body - all attached entities have "tc.tmp"
# Called by code/run - all relevant data is already in storages

scoreboard players set $if_success tc.tmp 0


## GET VALUE
# Get list of counters
data modify storage tc:tmp Counters set from entity @s ArmorItems[3].tag.Counters


# Iterate: for every counter in list, check if its name matches the one in run_line
execute store result score $counter_index tc.tmp run data get storage tc:tmp Counters
scoreboard players set $different_name tc.tmp 1

execute if score $counter_index tc.tmp matches 1.. run function tc:code/run/instructions/counter/find_name


# Get value from counter. If none was found, default to 0
execute if score $different_name tc.tmp matches 1 run scoreboard players set $counter_value tc.tmp 0
execute if score $different_name tc.tmp matches 0 store result score $counter_value tc.tmp run data get storage tc:tmp Counters[-1].value





## COMPARE VALUE
execute if data storage tc:tmp {run_line:{A:{type:"value"}}} store result score $counter_operator tc.tmp run data get storage tc:tmp run_line.A.value
execute if data storage tc:tmp {run_line:{A:{type:"counter"}}} run function tc:code/run/instructions/counter/from_counter


# Operation
execute if data storage tc:tmp {run_line:{A:{operation:"="}}} if score $counter_value tc.tmp = $counter_operator tc.tmp run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{operation:"<"}}} if score $counter_value tc.tmp < $counter_operator tc.tmp run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{operation:"<="}}} if score $counter_value tc.tmp <= $counter_operator tc.tmp run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{operation:">"}}} if score $counter_value tc.tmp > $counter_operator tc.tmp run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{operation:">="}}} if score $counter_value tc.tmp >= $counter_operator tc.tmp run scoreboard players set $if_success tc.tmp 1





## Clear tmp
data remove storage tc:tmp Counters
scoreboard players reset $counter_index tc.tmp
scoreboard players reset $different_name tc.tmp
scoreboard players reset $counter_value tc.tmp
scoreboard players reset $counter_operator tc.tmp
