# Turn <direction>

execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"left"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "right"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 0 if data storage turtlecraft:tmp {edit_arg:{direction:"right"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "back"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"right"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "left"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"back"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "left"
