# Executed by player - all turtle entities have "tc.tmp"

advancement grant @s only tc:change_cosmetic
data modify entity @e[limit=1,type=minecraft:block_display,tag=tc.tmp,tag=tc.block] block_state.Name set from entity @s SelectedItem.id
