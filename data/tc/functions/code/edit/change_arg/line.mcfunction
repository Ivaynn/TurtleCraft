# Line <operation> <line>

# Operation
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{operation:"set"}} run data modify storage tc:tmp list_start[-1].A.operation set value "add"
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{operation:"add"}} run data modify storage tc:tmp list_start[-1].A.operation set value "remove"
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{operation:"remove"}} run data modify storage tc:tmp list_start[-1].A.operation set value "set"


# Line
execute if score $argument tc.tmp matches 2..5 store result score $new_line tc.tmp run data get storage tc:tmp edit_arg.line
execute if score $argument tc.tmp matches 2 run scoreboard players remove $new_line tc.tmp 10
execute if score $argument tc.tmp matches 3 run scoreboard players remove $new_line tc.tmp 1
execute if score $argument tc.tmp matches 4 run scoreboard players add $new_line tc.tmp 1
execute if score $argument tc.tmp matches 5 run scoreboard players add $new_line tc.tmp 10
execute if score $argument tc.tmp matches 2..5 unless score $new_line tc.tmp matches 1.. run scoreboard players set $new_line tc.tmp 1
execute if score $argument tc.tmp matches 2..5 unless score $new_line tc.tmp < $line_count tc.tmp run scoreboard players operation $new_line tc.tmp = $line_count tc.tmp
execute if score $argument tc.tmp matches 2..5 store result storage tc:tmp list_start[-1].A.line int 1 run scoreboard players get $new_line tc.tmp


# Clear tmp
scoreboard players reset $new_line tc.tmp
