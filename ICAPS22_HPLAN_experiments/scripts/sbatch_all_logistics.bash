#!/bin/sh
sbatch -n 1 -N 1 --share -t 00:04:00 run_exp_logistics_curriculum.bash
sbatch -n 1 -N 1 --share -t 00:04:00 run_exp_logistics_original.bash
sbatch -n 1 -N 1 --share -t 00:04:00 run_exp_logistics_curriculum_prune.bash
sbatch -n 1 -N 1 --share -t 00:04:00 run_exp_logistics_original_prune.bash
