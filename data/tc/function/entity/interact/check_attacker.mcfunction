# This function is triggered by an advancement


execute on attacker if entity @s[tag=tc.player] run scoreboard players set $this_player tc.tmp 1
execute if score $this_player tc.tmp matches 1 unless data entity @s {HurtTime:0s} run function tc:entity/interact/init
scoreboard players reset $this_player tc.tmp
