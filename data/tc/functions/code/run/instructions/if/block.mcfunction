# Executed by tc.body - all attached entities have "tc.tmp"
# Called by code/run - all relevant data is already in storages
# Executed at block coordinates

scoreboard players set $if_success tc.tmp 0

# Special cases
execute if data storage tc:tmp {run_line:{A:{block:"air"}}} if block ~ ~ ~ #tc:air run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{block:"water"}}} if block ~ ~ ~ minecraft:water run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{block:"lava"}}} if block ~ ~ ~ minecraft:lava run scoreboard players set $if_success tc.tmp 1
execute if data storage tc:tmp {run_line:{A:{block:"powder_snow"}}} if block ~ ~ ~ minecraft:powder_snow run scoreboard players set $if_success tc.tmp 1


# Check what item drops with silk touch
execute if score $if_success tc.tmp matches 0 run setblock 10028 0 10028 minecraft:barrel
execute if score $if_success tc.tmp matches 0 run loot insert 10028 0 10028 mine ~ ~ ~ minecraft:shears{tc:"if_block", Enchantments:[{id:"minecraft:silk_touch",lvl:1s}]}


# Check if dropped item id is the same that's stored on the condition
execute if score $if_success tc.tmp matches 0 if data block 10028 0 10028 Items[0].id store success score $slot_replaced tc.tmp run data modify block 10028 0 10028 Items[0].id set from storage tc:tmp run_line.A.block
execute if score $slot_replaced tc.tmp matches 0 run scoreboard players set $if_success tc.tmp 1


# Clear tmp
setblock 10028 0 10028 minecraft:bedrock
scoreboard players reset $slot_replaced tc.tmp
