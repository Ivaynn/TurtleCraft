# Mine/attack/harvest <direction>

execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 0 if data storage turtlecraft:tmp {edit_arg:{direction:"forward"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "back"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 0 if data storage turtlecraft:tmp {edit_arg:{direction:"back"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "left"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 0 if data storage turtlecraft:tmp {edit_arg:{direction:"left"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "right"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 0 if data storage turtlecraft:tmp {edit_arg:{direction:"right"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "up"

execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"forward"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "up"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"back"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "forward"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"left"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "forward"
execute if score $argument turtlecraft.tmp matches 1 if score limit_directions turtlecraft.options matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"right"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "forward"

execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"up"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "down"
execute if score $argument turtlecraft.tmp matches 1 if data storage turtlecraft:tmp {edit_arg:{direction:"down"}} run data modify storage turtlecraft:tmp list_start[-1].A.direction set value "forward"
