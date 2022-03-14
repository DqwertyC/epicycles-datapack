tag @s add epi_active

tag @e remove epi_target
execute as @e[tag=epi_point,tag=current] if score @s epi_index = @e[tag=epi_point,tag=epi_active,limit=1] epi_target run tag @s add epi_target

execute if entity @e[tag=epi_target] run function epi_draw:position_loop_b
execute store result entity @s Rotation[0] float 0.001 run scoreboard players get @s epi_rot_y

# Update the position of the trailing mob, if applicable.
execute as @e[tag=epi_mob,tag=current] if score @s epi_index = @e[tag=epi_active,limit=1] epi_index at @e[tag=epi_active,limit=1] run tp @s ~ ~ ~-0.225 0 ~
execute as @e[tag=epi_mob,tag=current] if score @s epi_index = @e[tag=epi_active,limit=1] epi_index unless data entity @s Leash run data modify entity @s Leash.UUID set from entity @e[tag=epi_target,limit=1] UUID

tag @e[tag=epi_active] remove epi_active
tag @e[tag=epi_target] remove epi_target

scoreboard players add EpiGen epi_index 1
scoreboard players add EpiGen epi_target 1

execute as @e[tag=epi_point,tag=current] if score @s epi_index = EpiGen epi_index run function epi_draw:position_loop_a