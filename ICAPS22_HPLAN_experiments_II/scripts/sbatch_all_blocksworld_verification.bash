#!/bin/sh
sbatch -n 1 -N 1 --share -t 00:08:00 run_verification_blocksworld_curriculum.bash
sbatch -n 1 -N 1 --share -t 00:08:00 run_verification_blocksworld_original.bash
sbatch -n 1 -N 1 --share -t 00:08:00 run_verification_blocksworld_curriculum_prune.bash
sbatch -n 1 -N 1 --share -t 00:08:00 run_verification_blocksworld_original_prune.bash
