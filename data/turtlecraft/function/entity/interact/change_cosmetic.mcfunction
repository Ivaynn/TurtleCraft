# Executed by player - all turtle entities have "turtlecraft.tmp"

advancement grant @s only turtlecraft:change_cosmetic
data modify entity @e[limit=1,type=minecraft:block_display,tag=turtlecraft.tmp,tag=turtlecraft.block] block_state.Name set from entity @s SelectedItem.id
