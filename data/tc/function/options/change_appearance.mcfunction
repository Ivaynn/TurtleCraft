
scoreboard players add change_appearance tc.options 1
execute unless score change_appearance tc.options matches 0..1 run scoreboard players set change_appearance tc.options 0
function tc:options/pages/p2
