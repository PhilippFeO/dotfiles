file ./upas-l2
set args --so2 /home/sentinel5p-data/archive/L1B/2024/03/15/irradiance/OFFL/S5P_OFFL_L1B_IR_UVN_20240315T062230_20240315T080401_33268_03_020100_20240315T095524.nc /home/sentinel5p-data/archive/L1B/2024/03/15/33270/OFFL/S5P_OFFL_L1B_RA_BD3_20240315T094531_20240315T112702_33270_03_020100_20240315T131648.nc -b 2000 -n 10 -t 12 --alongtrack --aux-cloud $(find . -name "*L2__CLOUD*.nc" | sort -n | tail -n 1) --aux-o3 $(find . -name "*L2__O3*.nc" | sort -n | tail -n 1)

break Physics::Cobra::Cobra::Cobra()
run
