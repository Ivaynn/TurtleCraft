# Executed by tc.body - all attached entities have "tc.tmp"
# Called by code/run - all relevant data is already in storages

execute if score $chunk_loaded tc.tmp matches 1 unless loaded ~ ~ ~ run scoreboard players set $chunk_loaded tc.tmp 0
execute if score $chunk_loaded tc.tmp matches 0 run return 0

execute if data storage tc:tmp {run_line:{A:{direction:"forward"}}} at @s anchored eyes positioned ^ ^ ^1 run function tc:code/run/instructions/if/block
execute if data storage tc:tmp {run_line:{A:{direction:"back"}}} at @s anchored eyes positioned ^ ^ ^-1 run function tc:code/run/instructions/if/block
execute if data storage tc:tmp {run_line:{A:{direction:"left"}}} at @s anchored eyes positioned ^1 ^ ^ run function tc:code/run/instructions/if/block
execute if data storage tc:tmp {run_line:{A:{direction:"right"}}} at @s anchored eyes positioned ^-1 ^ ^ run function tc:code/run/instructions/if/block
execute if data storage tc:tmp {run_line:{A:{direction:"up"}}} at @s anchored eyes positioned ^ ^1 ^ run function tc:code/run/instructions/if/block
execute if data storage tc:tmp {run_line:{A:{direction:"down"}}} at @s anchored eyes positioned ^ ^-1 ^ run function tc:code/run/instructions/if/block
