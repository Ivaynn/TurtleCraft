# Executed by turtlecraft.turtle (every turtle entity) on special cases

# This function acts as a way to remove invalid turtles when they are found.
# If all goes well, this is never executed. However, some errors can happen.
# If any turtle entity executes this, it will drop its items and be removed.


# Count them for debug purposes
scoreboard players add $invalid_count turtlecraft.id 1


# Remove ID
scoreboard players reset @s turtlecraft.id


# Drop items 
execute as @s[tag=turtlecraft.body] at @s run function turtlecraft:entity/remove/as_body
execute as @s[tag=turtlecraft.body] at @s run tp @s ~ ~0.35 ~


# Remove entity + xp drops
execute as @s[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] at @s run function turtlecraft:entity/remove/void_kill
