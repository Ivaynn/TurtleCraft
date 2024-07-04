
scoreboard players add auto_refresh tc.options 1
execute unless score auto_refresh tc.options matches 0..1 run scoreboard players set auto_refresh tc.options 0
function tc:options/pages/p2
