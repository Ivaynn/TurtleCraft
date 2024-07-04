
scoreboard players add limit_counter_display tc.options 1
execute unless score limit_counter_display tc.options matches 0..1 run scoreboard players set limit_counter_display tc.options 0
function tc:options/pages/p2
