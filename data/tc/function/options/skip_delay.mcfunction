
scoreboard players add skip_purple_delay tc.options 1
execute unless score skip_purple_delay tc.options matches 0..1 run scoreboard players set skip_purple_delay tc.options 0
function tc:options/pages/p2
