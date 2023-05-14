# Executed by tc.turtle (every turtle entity) on special cases

# This function acts as a way to remove invalid turtles when they are found.
# If all goes well, this is never executed. However, some errors can happen.
# If any turtle entity executes this, it will drop its items and be removed.


# Count them for debug purposes
scoreboard players add $invalid_count tc.id 1


# Remove ID
scoreboard players reset @s tc.id


# Drop items 
execute as @s[tag=tc.body] at @s run function tc:entity/remove/as_body
execute as @s[tag=tc.body] at @s run tp @s ~ ~0.35 ~


# Remove entity + xp drops
execute as @s[type=#tc:turtle_parts,tag=tc.turtle] at @s run function tc:entity/remove/void_kill
