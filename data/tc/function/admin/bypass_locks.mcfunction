# Admin function - executed by player directly at any time

execute as @s[tag=!tc.bypass_locks] run return run tag @s add tc.bypass_locks
tag @s remove tc.bypass_locks
return fail
