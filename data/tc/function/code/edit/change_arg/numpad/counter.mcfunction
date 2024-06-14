# Executed by the player. All turtle components have tag "tc.tmp"


# If there's no value, return 0
execute unless data storage tc:tmp {edit_arg:{type:"value"}} unless data storage tc:tmp {edit_arg:{type:"random"}} run return 0


# Get current value
execute if data storage tc:tmp {edit_arg:{type:"value"}} store result score $new_value tc.tmp run data get storage tc:tmp edit_arg.value
execute if data storage tc:tmp {edit_arg:{type:"random"}} store result score $new_value tc.tmp run data get storage tc:tmp edit_arg.value


# Make changes
scoreboard players operation $original_value tc.tmp = $new_value tc.tmp
execute store result score $return tc.tmp run function tc:code/edit/change_arg/numpad/new_value
execute if score $return tc.tmp matches -1 run scoreboard players operation $new_value tc.tmp = $original_value tc.tmp


# Check bounds
execute if data storage tc:tmp {edit_arg:{type:"random"}} unless score $new_value tc.tmp matches 1.. run scoreboard players set $new_value tc.tmp 1
execute if data storage tc:tmp {edit_arg:{type:"random"}} if score $new_value tc.tmp matches 129.. run scoreboard players set $new_value tc.tmp 128


# Save changes
execute store result storage tc:tmp list_start[-1].A.value int 1 run scoreboard players get $new_value tc.tmp
