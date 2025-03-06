# Executed by the player. All turtle components have tag "turtlecraft.tmp"


# Remove the quotes (first and last characters)
data modify storage turtlecraft:tmp book.return set string storage turtlecraft:tmp book.return 1 -1


# Iterate
data modify storage turtlecraft:tmp book.iterate set from storage turtlecraft:tmp book.return
function turtlecraft:code/edit/change_arg/book/iterate


# Clear tmp
scoreboard players reset $newline turtlecraft.tmp
scoreboard players reset $more_char turtlecraft.tmp
