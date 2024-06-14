# Executed by tc.body. All turtle entities have "tc.tmp"


## FIND COUNTER
data modify storage tc:tmp Counters set from entity @s ArmorItems[3].components."minecraft:custom_data".tc.Counters
data modify storage tc:tmp list_end set from storage tc:tmp Counters


# Iterate: for every counter in list, check if its name matches the one in run_line
execute store result score $counter_index tc.tmp run data get storage tc:tmp Counters
scoreboard players set $different_name tc.tmp 1

execute if score $counter_index tc.tmp matches 1.. run function tc:code/run/instructions/counter/find_name


# If no counter was found, create a new one at the end of the list
execute if score $different_name tc.tmp matches 1 run function tc:code/run/instructions/counter/new_counter





## EDIT VALUE
execute store result score $counter_value tc.tmp run data get storage tc:tmp Counters[-1].value


# Get operator
execute if data storage tc:tmp {run_line:{A:{type:"value"}}} store result score $counter_operator tc.tmp run data get storage tc:tmp run_line.A.value
execute if data storage tc:tmp {run_line:{A:{type:"counter"}}} run function tc:code/run/instructions/counter/from_counter
execute if data storage tc:tmp {run_line:{A:{type:"pos"}}} run function tc:code/run/instructions/counter/from_pos
execute if data storage tc:tmp {run_line:{A:{type:"fuel"}}} run scoreboard players operation $counter_operator tc.tmp = @s tc.fuel
execute if data storage tc:tmp {run_line:{A:{type:"random"}}} run function tc:code/run/instructions/counter/from_random


# Operation
execute if data storage tc:tmp {run_line:{A:{operation:"="}}} run scoreboard players operation $counter_value tc.tmp = $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:"+="}}} run scoreboard players operation $counter_value tc.tmp += $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:"-="}}} run scoreboard players operation $counter_value tc.tmp -= $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:"*="}}} run scoreboard players operation $counter_value tc.tmp *= $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:"/="}}} run scoreboard players operation $counter_value tc.tmp /= $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:"%="}}} run scoreboard players operation $counter_value tc.tmp %= $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:"<"}}} run scoreboard players operation $counter_value tc.tmp < $counter_operator tc.tmp
execute if data storage tc:tmp {run_line:{A:{operation:">"}}} run scoreboard players operation $counter_value tc.tmp > $counter_operator tc.tmp





## SAVE CHANGES
execute store result storage tc:tmp Counters[-1].value int 1 run scoreboard players get $counter_value tc.tmp 


# Make a new list with all values from $counter_index (excluded) to end
execute if score $counter_index tc.tmp matches 0.. run function tc:code/run/instructions/counter/remove_first


# Merge lists (Counters + list_end)
execute store result score $counter_merge tc.tmp run data get storage tc:tmp list_end
execute if score $counter_merge tc.tmp matches 0.. run function tc:code/run/instructions/counter/merge_list



# Apply changes (without data modify entity because that closes the llama GUI)
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stick",count:1b}]}
data modify block 10028 0 10028 Items[0].components."minecraft:custom_data".tc.Counters set from storage tc:tmp Counters
loot replace entity @s armor.head 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]



# Auto refresh
execute if score auto_refresh tc.options matches 1 as @a[distance=..10,scores={tc.id=1..,tc.page=3}] if score @s tc.id = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.id run function tc:code/edit/display/pages/counters



## Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage tc:tmp Counters
data remove storage tc:tmp list_end

scoreboard players reset $different_name tc.tmp
scoreboard players reset $counter_index tc.tmp
scoreboard players reset $counter_value tc.tmp
scoreboard players reset $counter_operator tc.tmp
scoreboard players reset $counter_merge tc.tmp
