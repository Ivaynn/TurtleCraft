# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# If turtle is locked - check player UUID
execute store result score $turtle_lock turtlecraft.tmp run data get entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].Locked 1
execute if score $turtle_lock turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp uuid.owner set from entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Owner.UUID
execute if score $turtle_lock turtlecraft.tmp matches 1 run data modify storage turtlecraft:tmp uuid.self set from entity @s UUID
execute if score $turtle_lock turtlecraft.tmp matches 1 store success score $different_uuid turtlecraft.tmp run data modify storage turtlecraft:tmp uuid.owner set from storage turtlecraft:tmp uuid.self


# Clear tmp
execute if score $turtle_lock turtlecraft.tmp matches 1 run data remove storage turtlecraft:tmp uuid
scoreboard players reset $turtle_lock turtlecraft.tmp


# Bypass locks tag
execute as @s[tag=turtlecraft.bypass_locks] run scoreboard players set $different_uuid turtlecraft.tmp 0


# If owner == player, continue
execute unless score $different_uuid turtlecraft.tmp matches 1 run function turtlecraft:code/edit/init


# Else: show limited info + owner's name
execute if score $different_uuid turtlecraft.tmp matches 1 run function turtlecraft:code/edit/display/locked_info
scoreboard players reset $different_uuid turtlecraft.tmp
