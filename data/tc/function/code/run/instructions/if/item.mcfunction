# Executed by tc.body - all attached entities have "tc.tmp"
# Called by code/run - all relevant data is already in storages

scoreboard players set $if_success tc.tmp 0

# If "all", any item on inventory is enough for success
execute if data storage tc:tmp {run_line:{A:{item:"all"}}} if data entity @s Items[0] run scoreboard players set $if_success tc.tmp 1

# Put inventory in a storage
execute if score $if_success tc.tmp matches 0 run data modify storage tc:tmp item_check set from entity @s Items

# Try to replace the ID of every used slot (15 slots, 0..14) with the ID in the condition
scoreboard players set $slot_replaced tc.tmp 1
execute if score $if_success tc.tmp matches 1 run scoreboard players set $slot_replaced tc.tmp 0

execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[0].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[0].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[1].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[1].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[2].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[2].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[3].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[3].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[4].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[4].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[5].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[5].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[6].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[6].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[8].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[7].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[8].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[8].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[9].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[9].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[10].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[10].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[11].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[11].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[12].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[12].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[13].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[13].id set from storage tc:tmp run_line.A.item
execute if score $slot_replaced tc.tmp matches 1 if data storage tc:tmp item_check[14].id store success score $slot_replaced tc.tmp run data modify storage tc:tmp item_check[14].id set from storage tc:tmp run_line.A.item


# If one slot failed to replace the ID, that means the ID was the same
execute if score $slot_replaced tc.tmp matches 0 run scoreboard players set $if_success tc.tmp 1


# Clear tmp
scoreboard players reset $slot_replaced tc.tmp
data remove storage tc:tmp item_check
