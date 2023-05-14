# Executed by the player. All turtle components have tag "tc.tmp"


# Figure out name source:
# 1: default, "name"
# 2: item ID (remove namespace)
# 3: item Name (convert from json)

scoreboard players set $name_src tc.tmp 1
execute if data entity @s SelectedItem.id run scoreboard players add $name_src tc.tmp 1
execute if data entity @s SelectedItem.tag.display.Name run scoreboard players add $name_src tc.tmp 1

execute if score $name_src tc.tmp matches 1 run data modify storage tc:tmp counter_name.name set value "name"
execute if score $name_src tc.tmp matches 2 run function tc:code/edit/change_arg/counter_name_id
execute if score $name_src tc.tmp matches 3 run data modify storage tc:tmp counter_name.name set from entity @s SelectedItem.tag.display.Name


# Clear tmp
scoreboard players reset $name_src tc.tmp
