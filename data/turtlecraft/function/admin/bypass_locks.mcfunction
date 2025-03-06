# Admin function - executed by player directly at any time

execute as @s[tag=!turtlecraft.bypass_locks] run return run tag @s add turtlecraft.bypass_locks
tag @s remove turtlecraft.bypass_locks
return fail
