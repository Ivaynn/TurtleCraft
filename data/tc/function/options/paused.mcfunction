
scoreboard players add paused tc.options 1
execute unless score paused tc.options matches 0..1 run scoreboard players set paused tc.options 0
function tc:options/pages/p2
