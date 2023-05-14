# Grab/drop <item_id>

execute if score $argument tc.tmp matches 1 run data modify storage tc:tmp list_start[-1].A.item set from entity @s SelectedItem.id
execute if score $argument tc.tmp matches 1 unless data entity @s SelectedItem run data modify storage tc:tmp list_start[-1].A.item set value "all"
