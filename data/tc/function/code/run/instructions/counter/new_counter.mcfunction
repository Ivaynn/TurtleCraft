
# Reset "cursor" to the end of the list
data modify storage tc:tmp Counters set from storage tc:tmp list_end
execute store result score $counter_index tc.tmp run data get storage tc:tmp Counters

# Append new counter
data modify storage tc:tmp Counters append value {name:"name",value:0}
data modify storage tc:tmp Counters[-1].name set from storage tc:tmp run_line.A.name
