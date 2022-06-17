#!/bin/bash

#######################################################################################
# HELP

# make sure that ctpService for each part is running
# to launch:
#    ctpService --robot <name> --part <part>

#######################################################################################
usage() {
cat << EOF
***************************************************************************************
PROTO TEST SCRIPTING

USAGE:
        $0 options

***************************************************************************************
OPTIONS:

***************************************************************************************
EXAMPLE USAGE:

***************************************************************************************
EOF
}

#######################################################################################
# HELPER FUNCTIONS
######################################################################################

list_joints() {
    echo -e "(0: shoulder_pitch 1: shoulder_roll    2: shoulder_yaw   3: elbow\n" \
             "4: wrist_prosup   5: wrist_pitch      6: wrist_yaw      7: hand_fingers\n" \
             "8: thumb_oppose   9: thumb_proximal   10: thumb_distal  11: index_proximal\n" \
             "12: index_distal  13: middle_proximal 14: middle_distal 15: pinky)"
}

home() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (0 0 0)" | yarp rpc /ctpservice/head/rpc

}

pitchP() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (20 0 0)" | yarp rpc /ctpservice/head/rpc
}

pitchN() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (-20 0 0)" | yarp rpc /ctpservice/head/rpc
}

rollP() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (0 10 0)" | yarp rpc /ctpservice/head/rpc
}

rollN() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (0 -10 0)" | yarp rpc /ctpservice/head/rpc
}

combP() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (20 10 0)" | yarp rpc /ctpservice/head/rpc
}

combN() {
    # This is with the arms over the table
    echo "ctpn time $1 off 0 pos (-20 -10 0)" | yarp rpc /ctpservice/head/rpc
}

seq() {
    pitchP 1
    sleep 2.0
    pitchN 1
    sleep 2.0
    home 0.5
    sleep 1
    rollP 1
    sleep 2.0
    rollN 1
    sleep 2.0
    home 0.5
    sleep 1
    combP 1
    sleep 2.0
    combN 1
    sleep 2.0
    home 0.5
}

#######################################################################################
# "MAIN" FUNCTION:                                                                    #
#######################################################################################
echo "********************************************************************************"
echo ""

$1 "$2"

if [[ $# -eq 0 ]] ; then
    echo "No options were passed!"
    echo ""
    usage
    exit 1
fi
