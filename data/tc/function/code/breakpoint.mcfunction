# Executed by tc.body - all attached entities have "tc.tmp"

execute as @s[tag=tc.breakpoint] run return run tag @s remove tc.breakpoint
function tc:code/pause
scoreboard players set @s tc.msg 11
scoreboard players set $command tc.tmp -1
tag @s add tc.breakpoint
