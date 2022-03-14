scoreboard players set EpiGen epi_index 0
scoreboard players set EpiGen epi_target -1

tag @e[tag=current] remove current
tag @s add current
execute as @e[tag=!current] if score @s epi_id = @e[tag=current,limit=1] epi_id run tag @s add current

scoreboard players operation EpiGen epi_target_id = @s epi_id
execute as @e[tag=epi_point,tag=current] if score @s epi_index = EpiGen epi_index run function epi_draw:position_loop_a