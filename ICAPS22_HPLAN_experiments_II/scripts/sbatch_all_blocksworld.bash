#!/bin/sh
sbatch -n 1 -N 1 --share -t 00:30:00 run_exp_blocksworld_curriculum.bash
sbatch -n 1 -N 1 --share -t 00:30:00 run_exp_blocksworld_original.bash
sbatch -n 1 -N 1 --share -t 00:30:00 run_exp_blocksworld_curriculum_prune.bash
sbatch -n 1 -N 1 --share -t 00:30:00 run_exp_blocksworld_original_prune.bash
