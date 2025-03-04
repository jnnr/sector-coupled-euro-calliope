#!/bin/sh
#BSUB -J spores_exclude_2h_shared[1-32]
#BSUB -n 6
#BSUB -R "rusage[mem=120G, scratch=10000]"
#BSUB -W 7200
#BSUB -r
#BSUB -o /cluster/work/cpesm/brynmorp/sentinel-free-model-runs/2050/build/logs/spores_exclude_shared/log_%I.log

module load gurobi/9.0.2

DIR="/cluster/work/cpesm/brynmorp/sentinel-free-model-runs/2050"

mkdir -p  "${DIR}/build/logs/spores_exclude_shared"

cd $TMPDIR

sh "${DIR}/run_scripts/spores_exclude_jobs.sh" ${LSB_JOBINDEX} "${DIR}/build/ehighways/demand_change.nc" "${DIR}/build/ehighways/spores_2h/16-industry_fuel_shared,spores_supply/" "${DIR}/run_scripts" 0.1
