# Executed by the player. All turtle components have tag "tc.tmp"


# Get current value
execute store result score $new_value tc.tmp run data get storage tc:tmp edit_arg.count


# Make changes
scoreboard players operation $original_value tc.tmp = $new_value tc.tmp
execute store result score $return tc.tmp run function tc:code/edit/change_arg/numpad/new_value
execute if score $return tc.tmp matches -1 run scoreboard players operation $new_value tc.tmp = $original_value tc.tmp
scoreboard players reset $negative tc.tmp


# Check bounds
execute unless score $new_value tc.tmp matches 1.. run scoreboard players set $new_value tc.tmp 1


# Save changes
execute store result storage tc:tmp list_start[-1].A.count int 1 run scoreboard players get $new_value tc.tmp
