#!/bin/sh
#BSUB -J eurospores_spores[1-16]
#BSUB -n 6
#BSUB -R "rusage[mem=100G]"
#BSUB -W 7200
#BSUB -r
#BSUB -o /cluster/work/cpesm/brynmorp/sentinel-free-model-runs/2050/build/logs/spores_continue_2h_15slack/log_%I.log


DIR="/cluster/work/cpesm/brynmorp/sentinel-free-model-runs/2050"

declare -a array=("industry_fuel_isolated,spores_electricity" "industry_fuel_shared,spores_electricity" "industry_fuel_isolated,spores_storage" "industry_fuel_shared,spores_storage" "industry_fuel_isolated,spores_transmission" "industry_fuel_shared,spores_transmission" "industry_fuel_isolated,spores_fuel" "industry_fuel_shared,spores_fuel" "industry_fuel_isolated,spores_transport" "industry_fuel_shared,spores_transport" "industry_fuel_isolated,spores_heat" "industry_fuel_shared,spores_heat" "industry_fuel_isolated,spores_all" "industry_fuel_shared,spores_all"  "industry_fuel_isolated,spores_supply" "industry_fuel_shared,spores_supply")

mkdir -p "${DIR}/build/ehighways/spores_2h_15slack" "${DIR}/build/logs/spores_continue_2h_15slack"

python "${DIR}/run_scripts/continue_spores.py" "${DIR}/build/ehighways/spores_2h_15slack/${LSB_JOBINDEX}-${array[${LSB_JOBINDEX}-1]}/" --slack 0.15
