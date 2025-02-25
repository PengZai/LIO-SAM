
DATASET="BotanicGarden"
DIR="1005_07"
TEST_DIR="test_2"

ESITMATED_FOLDER="liosam_lidar_inertial_for_${DIR}_img10hz600p"
REFERENCE="${DIR}_GT_output.txt"

evo_rpe tum $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/${ESITMATED_FOLDER}_traj_coordinate_aligned.txt $DATASET/$DIR/$REFERENCE  > $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/rpe_${ESITMATED_FOLDER}_traj_coordinate_aligned.log
evo_ape tum $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/${ESITMATED_FOLDER}_traj_coordinate_aligned.txt $DATASET/$DIR/$REFERENCE  > $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/ape_${ESITMATED_FOLDER}_traj_coordinate_aligned.log
evo_ape tum $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/${ESITMATED_FOLDER}_traj_coordinate_aligned.txt $DATASET/$DIR/$REFERENCE --align --pose_relation trans_part > $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/ate_${ESITMATED_FOLDER}_traj_coordinate_aligned.log

evo_traj tum $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/${ESITMATED_FOLDER}_traj_coordinate_aligned.txt --ref=$DATASET/$DIR/$REFERENCE -p --plot_mode=xyz --save_plot $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/3d  
evo_traj tum $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/${ESITMATED_FOLDER}_traj_coordinate_aligned.txt --ref=$DATASET/$DIR/$REFERENCE -p --plot_mode=xy --save_plot $DATASET/$DIR/${ESITMATED_FOLDER}/${TEST_DIR}/2d 
