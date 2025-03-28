# Executed by turtlecraft.body. All turtle entities have "turtlecraft.tmp"


## FIND COUNTER
data modify storage turtlecraft:tmp Counters set from entity @s equipment.head.components."minecraft:custom_data".turtlecraft.Counters
data modify storage turtlecraft:tmp list_end set from storage turtlecraft:tmp Counters


# Iterate: for every counter in list, check if its name matches the one in run_line
execute store result score $counter_index turtlecraft.tmp run data get storage turtlecraft:tmp Counters
scoreboard players set $different_name turtlecraft.tmp 1

execute if score $counter_index turtlecraft.tmp matches 1.. run function turtlecraft:code/run/instructions/counter/find_name


# If no counter was found, create a new one at the end of the list
execute if score $different_name turtlecraft.tmp matches 1 run function turtlecraft:code/run/instructions/counter/new_counter





## EDIT VALUE
execute store result score $counter_value turtlecraft.tmp run data get storage turtlecraft:tmp Counters[-1].value


# Get operator
execute if data storage turtlecraft:tmp {run_line:{A:{type:"value"}}} store result score $counter_operator turtlecraft.tmp run data get storage turtlecraft:tmp run_line.A.value
execute if data storage turtlecraft:tmp {run_line:{A:{type:"counter"}}} run function turtlecraft:code/run/instructions/counter/from_counter
execute if data storage turtlecraft:tmp {run_line:{A:{type:"pos"}}} run function turtlecraft:code/run/instructions/counter/from_pos
execute if data storage turtlecraft:tmp {run_line:{A:{type:"fuel"}}} run scoreboard players operation $counter_operator turtlecraft.tmp = @s turtlecraft.fuel
execute if data storage turtlecraft:tmp {run_line:{A:{type:"random"}}} run function turtlecraft:code/run/instructions/counter/from_random


# Operation
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"="}}} run scoreboard players operation $counter_value turtlecraft.tmp = $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"+="}}} run scoreboard players operation $counter_value turtlecraft.tmp += $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"-="}}} run scoreboard players operation $counter_value turtlecraft.tmp -= $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"*="}}} run scoreboard players operation $counter_value turtlecraft.tmp *= $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"/="}}} run scoreboard players operation $counter_value turtlecraft.tmp /= $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"%="}}} run scoreboard players operation $counter_value turtlecraft.tmp %= $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:"<"}}} run scoreboard players operation $counter_value turtlecraft.tmp < $counter_operator turtlecraft.tmp
execute if data storage turtlecraft:tmp {run_line:{A:{operation:">"}}} run scoreboard players operation $counter_value turtlecraft.tmp > $counter_operator turtlecraft.tmp





## SAVE CHANGES
execute store result storage turtlecraft:tmp Counters[-1].value int 1 run scoreboard players get $counter_value turtlecraft.tmp 


# Make a new list with all values from $counter_index (excluded) to end
execute if score $counter_index turtlecraft.tmp matches 0.. run function turtlecraft:code/run/instructions/counter/remove_first


# Merge lists (Counters + list_end)
execute store result score $counter_merge turtlecraft.tmp run data get storage turtlecraft:tmp list_end
execute if score $counter_merge turtlecraft.tmp matches 0.. run function turtlecraft:code/run/instructions/counter/merge_list



# Apply changes (without data modify entity because that closes the llama GUI)
setblock 10028 0 10028 minecraft:bedrock
setblock 10028 0 10028 minecraft:yellow_shulker_box{Items:[{Slot:0b,id:"minecraft:stick",count:1b}]}
data modify block 10028 0 10028 Items[0].components."minecraft:custom_data".turtlecraft.Counters set from storage turtlecraft:tmp Counters
loot replace entity @s armor.head 1 mine 10028 0 10028 minecraft:stone[minecraft:custom_data={drop_contents:1b}]



# Auto refresh
execute if score auto_refresh turtlecraft.options matches 1 as @a[distance=..10,scores={turtlecraft.id=1..,turtlecraft.page=3}] if score @s turtlecraft.id = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.id run function turtlecraft:code/edit/display/pages/counters



## Clear tmp
setblock 10028 0 10028 minecraft:bedrock
data remove storage turtlecraft:tmp Counters
data remove storage turtlecraft:tmp list_end

scoreboard players reset $different_name turtlecraft.tmp
scoreboard players reset $counter_index turtlecraft.tmp
scoreboard players reset $counter_value turtlecraft.tmp
scoreboard players reset $counter_operator turtlecraft.tmp
scoreboard players reset $counter_merge turtlecraft.tmp
