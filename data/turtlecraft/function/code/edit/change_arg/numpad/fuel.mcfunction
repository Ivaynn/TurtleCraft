# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Get current value
execute store result score $new_value turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.count


# Make changes
scoreboard players operation $original_value turtlecraft.tmp = $new_value turtlecraft.tmp
execute store result score $return turtlecraft.tmp run function turtlecraft:code/edit/change_arg/numpad/new_value
execute if score $return turtlecraft.tmp matches -1 run scoreboard players operation $new_value turtlecraft.tmp = $original_value turtlecraft.tmp
scoreboard players reset $negative turtlecraft.tmp


# Check bounds
execute unless score $new_value turtlecraft.tmp matches 1.. run scoreboard players set $new_value turtlecraft.tmp 1


# Save changes
execute store result storage turtlecraft:tmp list_start[-1].A.count int 1 run scoreboard players get $new_value turtlecraft.tmp
