# Executed by the player. All turtle components have tag "tc.tmp"


# Remove the quotes (first and last characters)
data modify storage tc:tmp book.return set string storage tc:tmp book.return 1 -1


# Iterate
data modify storage tc:tmp book.iterate set from storage tc:tmp book.return
function tc:code/edit/change_arg/book/iterate


# Clear tmp
scoreboard players reset $newline tc.tmp
scoreboard players reset $more_char tc.tmp
