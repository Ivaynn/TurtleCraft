# Executed by the player. All turtle components have tag "tc.tmp"

# Get data
data modify storage tc:tmp counter_name.name set from entity @s SelectedItem.id


# If string starts with "minecraft:", remove that namespace
data modify storage tc:tmp counter_name.copy set string storage tc:tmp counter_name.name 0 10
data modify storage tc:tmp counter_name.namespace set value "minecraft:"
execute store success score $different_ns tc.tmp run data modify storage tc:tmp counter_name.copy set string storage tc:tmp counter_name.namespace
execute if score $different_ns tc.tmp matches 0 run data modify storage tc:tmp counter_name.name set string storage tc:tmp counter_name.name 10


# Clear tmp
scoreboard players reset $different_ns tc.tmp
