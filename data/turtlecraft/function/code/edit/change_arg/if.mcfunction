# Executed by the player. All turtle components have tag "turtlecraft.tmp"


## TYPE
# Type (switch): item block counter
# Sets next arguments to defaults
execute if score $argument turtlecraft.tmp matches 1 run data remove storage turtlecraft:tmp list_start[-1].A

execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"item"}} run data modify storage turtlecraft:tmp list_start[-1].A.condition set value "block"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"item"}} run data modify storage turtlecraft:tmp list_start[-1].A.block set value "air"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"item"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "forward"

execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} run data modify storage turtlecraft:tmp list_start[-1].A.condition set value "counter"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} run data modify storage turtlecraft:tmp list_start[-1].A.name set value "name"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "="
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "value"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value 0

execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.condition set value "item"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{condition:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.item set value "all"



## item
# item (get id of selected item)
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"item"}} run data modify storage turtlecraft:tmp list_start[-1].A.item set from entity @s SelectedItem.id
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"item"}} unless data entity @s SelectedItem run data modify storage turtlecraft:tmp list_start[-1].A.item set value "all"



## block
# block (get id of selected item)
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} run data modify storage turtlecraft:tmp list_start[-1].A.block set from entity @s SelectedItem.id
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} unless data entity @s SelectedItem run data modify storage turtlecraft:tmp list_start[-1].A.block set value "air"
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} if data entity @s {SelectedItem:{id:"minecraft:water_bucket"}} run data modify storage turtlecraft:tmp list_start[-1].A.block set value "water"
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} if data entity @s {SelectedItem:{id:"minecraft:lava_bucket"}} run data modify storage turtlecraft:tmp list_start[-1].A.block set value "lava"
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"block"}} if data entity @s {SelectedItem:{id:"minecraft:powder_snow_bucket"}} run data modify storage turtlecraft:tmp list_start[-1].A.block set value "powder_snow"


# direction (switch): forward back left right up down
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"block",direction:"forward"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "back"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"block",direction:"back"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "left"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"block",direction:"left"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "right"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"block",direction:"right"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "up"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"block",direction:"up"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "down"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"block",direction:"down"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "forward"



## counter
# name (get id of selected item)
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"counter"}} run function turtlecraft:code/edit/change_arg/counter_name
execute if score $argument turtlecraft.tmp matches 2 if data storage turtlecraft:tmp {edit_arg:{condition:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.name set from storage turtlecraft:tmp counter_name.name


# operation (switch): = < <= > >=
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",operation:"="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "<"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",operation:"<"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "<="
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",operation:"<="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value ">"
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",operation:">"}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value ">="
execute if score $argument turtlecraft.tmp matches 3 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",operation:">="}} run data modify storage turtlecraft:tmp list_start[-1].A.operation set value "="


# type (switch): value counter
# Sets next arguments to defaults
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "counter"
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value "name"

execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.type set value "value"
execute if score $argument turtlecraft.tmp matches 4 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set value 0


# [value] value (int): -10 -1 +1 +10
execute if score $argument turtlecraft.tmp matches 5..8 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} store result score $counter_value turtlecraft.tmp run data get storage turtlecraft:tmp edit_arg.value
execute if score $argument turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} run scoreboard players remove $counter_value turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 6 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} run scoreboard players remove $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 7 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} run scoreboard players add $counter_value turtlecraft.tmp 1
execute if score $argument turtlecraft.tmp matches 8 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} run scoreboard players add $counter_value turtlecraft.tmp 10
execute if score $argument turtlecraft.tmp matches 5..8 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"value"}} store result storage turtlecraft:tmp list_start[-1].A.value int 1 run scoreboard players get $counter_value turtlecraft.tmp


# [counter] value (get from selected item)
execute if score $argument turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"counter"}} run function turtlecraft:code/edit/change_arg/counter_name
execute if score $argument turtlecraft.tmp matches 5 if data storage turtlecraft:tmp {edit_arg:{condition:"counter",type:"counter"}} run data modify storage turtlecraft:tmp list_start[-1].A.value set from storage turtlecraft:tmp counter_name.name


## Clear tmp
scoreboard players reset $counter_value turtlecraft.tmp
data remove storage turtlecraft:tmp counter_name
