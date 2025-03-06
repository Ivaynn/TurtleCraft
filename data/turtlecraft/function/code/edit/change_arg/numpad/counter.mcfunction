# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# If there's no value, return 0
execute unless data storage turtlecraft:tmp {edit_arg:{type:"value"}} unless data storage turtlecraft:tmp {edit_arg:{type:"random"}} run return 0


# Get current value
execute if data storage turtlecraft:tmp {edit_arg:{type:"value"}} store result score $new_value turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.value
execute if data storage turtlecraft:tmp {edit_arg:{type:"random"}} store result score $new_value turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.value


# Make changes
scoreboard players operation $original_value turtlecraft.tmp = $new_value turtlecraft.tmp
execute store result score $return turtlecraft.tmp run function turtlecraft:code/edit/change_arg/numpad/new_value
execute if score $return turtlecraft.tmp matches -1 run scoreboard players operation $new_value turtlecraft.tmp = $original_value turtlecraft.tmp


# Check bounds
execute if data storage turtlecraft:tmp {edit_arg:{type:"random"}} unless score $new_value turtlecraft.tmp matches 1.. run scoreboard players set $new_value turtlecraft.tmp 1
execute if data storage turtlecraft:tmp {edit_arg:{type:"random"}} if score $new_value turtlecraft.tmp matches 129.. run scoreboard players set $new_value turtlecraft.tmp 128


# Save changes
execute store result storage turtlecraft:tmp list_start[-1].A.value int 1 run scoreboard players get $new_value turtlecraft.tmp
