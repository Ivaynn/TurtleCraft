# Executed by the player. All turtle components have tag "tc.tmp"


# If turtle is locked - check player UUID
execute store result score $turtle_lock tc.tmp run data get entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Instructions[0].Locked 1
execute if score $turtle_lock tc.tmp matches 1 run data modify storage tc:tmp uuid.owner set from entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].components."minecraft:custom_data".tc.Owner.UUID
execute if score $turtle_lock tc.tmp matches 1 run data modify storage tc:tmp uuid.self set from entity @s UUID
execute if score $turtle_lock tc.tmp matches 1 store success score $different_uuid tc.tmp run data modify storage tc:tmp uuid.owner set from storage tc:tmp uuid.self


# Clear tmp
execute if score $turtle_lock tc.tmp matches 1 run data remove storage tc:tmp uuid
scoreboard players reset $turtle_lock tc.tmp


# If owner == player, continue
execute unless score $different_uuid tc.tmp matches 1 run function tc:code/edit/init


# Else: show limited info + owner's name
execute if score $different_uuid tc.tmp matches 1 run function tc:code/edit/display/locked_info
scoreboard players reset $different_uuid tc.tmp
