#!/bin/bash
pathDatasetEuroc='~/Downloads/euroc_test'

# Single Session Example (Visual-Inertial)
echo "Launching V102 with Monocular-Inertial sensor"
./Monocular-Inertial/mono_inertial_euroc ../Vocabulary/ORBvoc.txt ./Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/V102 ./Monocular-Inertial/EuRoC_TimeStamps/V102.txt dataset-V102_monoi
echo "------------------------------------"
echo "Evaluation of V102 trajectory with Monocular-Inertial sensor"
python ../evaluation/evaluate_ate_scale.py "$pathDatasetEuroc"/V102/mav0/state_groundtruth_estimate0/data.csv f_dataset-V102_monoi.txt --plot V102_monoi.pdf


# MultiSession Monocular Examples

echo "Launching Vicon Room 2 with Monocular-Inertial sensor"
./Monocular-Inertial/mono_inertial_euroc ../Vocabulary/ORBvoc.txt ./Monocular-Inertial/EuRoC.yaml "$pathDatasetEuroc"/V201 ./Monocular-Inertial/EuRoC_TimeStamps/V201.txt "$pathDatasetEuroc"/V202 ./Monocular-Inertial/EuRoC_TimeStamps/V202.txt "$pathDatasetEuroc"/V203 ./Monocular-Inertial/EuRoC_TimeStamps/V203.txt dataset-V201_to_V203_monoi
echo "------------------------------------"
echo "Evaluation of Vicon Room 2 trajectory with Stereo sensor"
python ../evaluation/evaluate_ate_scale.py ../evaluation/Ground_truth/EuRoC_imu/V2_GT.txt f_dataset-V201_to_V203_monoi.txt --plot V201_to_V203_monoi.pdf

