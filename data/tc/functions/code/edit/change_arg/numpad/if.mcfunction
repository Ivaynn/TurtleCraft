# Executed by the player. All turtle components have tag "tc.tmp"


# If there's no value, return 0
execute unless data storage tc:tmp {edit_arg:{condition:"counter",type:"value"}} run return 0


# Get current value
execute if data storage tc:tmp {edit_arg:{condition:"counter",type:"value"}} store result score $new_value tc.tmp run data get storage tc:tmp edit_arg.value


# Make changes
scoreboard players operation $original_value tc.tmp = $new_value tc.tmp
execute store result score $return tc.tmp run function tc:code/edit/change_arg/numpad/new_value
execute if score $return tc.tmp matches -1 run scoreboard players operation $new_value tc.tmp = $original_value tc.tmp
scoreboard players reset $negative tc.tmp


# Save changes
execute store result storage tc:tmp list_start[-1].A.value int 1 run scoreboard players get $new_value tc.tmp
