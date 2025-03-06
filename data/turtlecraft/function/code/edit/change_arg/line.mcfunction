# Line <operation> <line>

# Operation
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{operation:"set"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "add"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{operation:"add"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "remove"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{operation:"remove"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "set"


# Line
execute if score $argument turtlecraft.tmp matches 2..5 store result score $new_line turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.line
execute if score $argument turtlecraft.tmp matches 2 run scoreboard players remove $new_line turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 3 run scoreboard players remove $new_line turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 4 run scoreboard players add $new_line turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 5 run scoreboard players add $new_line turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 2..5 unless score $new_line turtlecraft.tmp matches 0.. run scoreboard players set $new_line turtlecraft.tmp 0
execute if score $argument turtlecraft.tmp matches 2..5 store result storage turtlecraft:tmp list_start[-1].A.line int 1 run scoreboard players get $new_line turtlecraft.tmp


# Clear tmp
scoreboard players reset $new_line turtlecraft.tmp
