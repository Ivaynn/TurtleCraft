# Executed by the player. All turtle components have tag "tc.tmp"

# If turtle is locked - check player UUID
data modify storage tc:tmp uuid.owner set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Owner.UUID
data modify storage tc:tmp uuid.self set from entity @s UUID
execute store success score $different_uuid tc.tmp run data modify storage tc:tmp uuid.owner set from storage tc:tmp uuid.self


# Clear tmp
scoreboard players reset $turtle_lock tc.tmp
data remove storage tc:tmp uuid


# If owner == player, continue
execute unless score $different_uuid tc.tmp matches 1 run function tc:entity/interact/as_player


# Else: show limited info + owner's name
execute if score $different_uuid tc.tmp matches 1 run function tc:code/edit/display/locked_info
scoreboard players reset $different_uuid tc.tmp
