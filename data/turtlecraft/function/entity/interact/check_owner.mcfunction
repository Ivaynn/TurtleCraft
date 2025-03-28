# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# If turtle is locked - check player UUID
data modify storage turtlecraft:tmp uuid.owner set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Owner.UUID
data modify storage turtlecraft:tmp uuid.self set from entity @s UUID
execute store success score $different_uuid turtlecraft.tmp run data modify storage turtlecraft:tmp uuid.owner set from storage turtlecraft:tmp uuid.self



# Clear tmp
scoreboard players reset $turtle_lock turtlecraft.tmp
data remove storage turtlecraft:tmp uuid


# Bypass locks tag
execute as @s[tag=turtlecraft.bypass_locks] run scoreboard players set $different_uuid turtlecraft.tmp 0


# If owner == player, continue
execute unless score $different_uuid turtlecraft.tmp matches 1 run function turtlecraft:entity/interact/as_player


# Else: show limited info + owner's name
execute if score $different_uuid turtlecraft.tmp matches 1 run function turtlecraft:code/edit/display/locked_info
scoreboard players reset $different_uuid turtlecraft.tmp
