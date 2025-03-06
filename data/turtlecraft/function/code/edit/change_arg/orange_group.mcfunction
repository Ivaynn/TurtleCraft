# Grab/drop <item_id>

execute if score $argument turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp list_start[-1].A.item set from entity @s SelectedItem.id
execute if score $argument turtlecraft.tmp matches 1 unless data entity @s SelectedItem run data modify storage turtlecraft:tmp list_start[-1].A.item set value "all"
