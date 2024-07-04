# Executed by tc.body - all attached entities have "tc.tmp"


# No version defined: v1 -> v2
execute unless score @s tc.version matches 2.. run function tc:entity/upgrade_version/v1_2

# Future versions: v2 -> v3, etc.
