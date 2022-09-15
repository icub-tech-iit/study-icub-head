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
    echo("-- pitch --")
    pitchP 1
    sleep 1.0
    pitchN 1
    sleep 1.0
    home 0.5
    sleep 1
    echo("-- roll --")
    rollP 1
    sleep 1.0
    rollN 1
    sleep 1.0
    home 0.5
    sleep 1
    echo("-- combined --")
    combP 1
    sleep 1.0
    combN 1
    sleep 1.0
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
