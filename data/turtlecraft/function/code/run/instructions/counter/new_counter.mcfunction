
# Reset "cursor" to the end of the list
data modify storage turtlecraft:tmp Counters set from storage turtlecraft:tmp list_end
execute store result score $counter_index turtlecraft.tmp run data get storage turtlecraft:tmp Counters

# Append new counter
data modify storage turtlecraft:tmp Counters append value {name:"name",value:0}
data modify storage turtlecraft:tmp Counters[-1].name set from storage turtlecraft:tmp run_line.A.name
