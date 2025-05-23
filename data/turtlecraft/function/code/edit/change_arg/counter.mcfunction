# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# name (get from selected item)
execute if score $argument turtlecraft.tmp matches 1 run function turtlecraft:code/edit/change_arg/counter_name
execute if score $argument turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp list_start[-1].A.name set from storage turtlecraft:tmp counter_name.name


# operation (switch): = += -= *= /= %= < >
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "+="
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"+="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "-="
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"-="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "*="
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"*="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "/="
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"/="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "%="
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"%="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "<"
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:"<"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value ">"
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{operation:">"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "="


# type (switch): value counter pos fuel random
# Sets next arguments to defaults
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "counter"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "name"

execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "pos"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "x"

execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"pos"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "fuel"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"pos"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value 0

execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"fuel"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "random"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"fuel"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value 1

execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "value"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value 0


# [value] value (int): -10 -1 +1 +10
execute if score $argument turtlecraft.tmp matches 4..7 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} store result score $counter_value turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.value
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} run scoreboard players remove $counter_value turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} run scoreboard players remove $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} run scoreboard players add $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} run scoreboard players add $counter_value turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 4..7 if data storage turtlecraft:tmp {edit_arg:{type:"value"}} store result storage turtlecraft:tmp list_start[-1].A.value int 1 run scoreboard players get $counter_value turtlecraft.tmp


# [counter] value (get from selected item)
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"counter"}} run function turtlecraft:code/edit/change_arg/counter_name
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set from storage turtlecraft:tmp counter_name.name


# [pos] value (switch): x y z
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"pos",value:"x"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "y"
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"pos",value:"y"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "z"
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"pos",value:"z"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "r"
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"pos",value:"r"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "x"


# [random] value (int): -10 -1 +1 +10
execute if score $argument turtlecraft.tmp matches 4..7 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} store result score $counter_value turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.value
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} run scoreboard players remove $counter_value turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} run scoreboard players remove $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} run scoreboard players add $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} run scoreboard players add $counter_value turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 4..7 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} unless score $counter_value turtlecraft.tmp matches 1.. run scoreboard players set $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 4..7 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} if score $counter_value turtlecraft.tmp matches 129.. run scoreboard players set $counter_value turtlecraft.tmp 128
execute if score $argument turtlecraft.tmp matches 4..7 if data storage turtlecraft:tmp {edit_arg:{type:"random"}} store result storage turtlecraft:tmp list_start[-1].A.value int 1 run scoreboard players get $counter_value turtlecraft.tmp


# Clear tmp
scoreboard players reset $counter_value turtlecraft.tmp
data remove storage turtlecraft:tmp counter_name
