
scoreboard players add show_warnings tc.options 1
execute unless score show_warnings tc.options matches 0..1 run scoreboard players set show_warnings tc.options 0
function tc:options/pages/p2
