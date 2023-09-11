
# Check if line type is 95 = "line"
execute store result score $line_type tc.tmp run data get storage tc:tmp line_set_copy[0].C 1
execute unless score $line_type tc.tmp matches 95 run return 0


# Check if "operation" is "set"
data modify storage tc:tmp line_update set from storage tc:tmp line_set_copy[0]
execute unless data storage tc:tmp line_update{A:{operation:"set"}} run return 0


# Check if line number is above the selected line
execute store result score $line_number tc.tmp run data get storage tc:tmp line_update.A.line
execute unless score $line_number tc.tmp > @s tc.line run return 0


# Update
scoreboard players operation $line_number tc.tmp += $line_set_diff tc.tmp
execute unless score $line_number tc.tmp matches 1.. run scoreboard players set $line_number tc.tmp 1
execute store result storage tc:tmp line_set_copy[0].A.line int 1 run scoreboard players get $line_number tc.tmp
