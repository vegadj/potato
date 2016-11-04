#!/usr/bin/env bash

# Potato by Gokhan SELAMET (2016)

pomodoroWorkMinutes=25
pomodoroBreakMinutes=5
#pomodoroLogFile=$HOME/potato.csv
pomodoroLogFile=./test.csv
datelogFormat="%d/%m/%y"
hourlogFormat="%H:%M"
BreakEndMessage="Working time"
WorkEndMessage="Time for Break"

# Turn ON/OFF flags blow 1=On; 0=False;

notificationFlag=1 # Notification will pop up on the left corner
sayFlag=1 # Audio alert
autoBreakFlag=0 #

########################## Source ##########################
# Do not change anything below this line if                #
# you are not sure what you are doing                      #
############################################################

## Defaults
chronometerFlag=0
isInBreak=0
verboseModeFlag=0
secondsRefresh=59
manualModFlag=0
## Default fi

function main {
	parseArguments $@; shift $((OPTIND-1))
    trap "quit" SIGINT
    L_startTime=`date +$hourlogFormat`
    L_tag=$1
	# TODO Switch case
    if [ $chronometerFlag -eq 1 ]; then
        chronometer
    else
        timer $pomodoroWorkMinutes
    fi
    workEndEvent
    quit
}

function timer {
mins=$1
secs=0
while [ $secs -gt -1 ] && [ $mins -gt -1 ];
do
	echo -ne "Min:$mins Sec:$secs\033[0K\r"
	sleep 1
	let "secs=secs-1"
	if [ $secs -eq -1 ]; then
	let "mins=mins-1"
	let "secs=$secondsRefresh"
	fi
done
}

function chronometer {
mins=0
secs=0
while [ 0 ];
do
	echo -ne "Min:$mins Sec:$secs\033[0K\r"
	sleep 1
	let "secs=secs+1"
	if [ $secs -eq $secondsRefresh ]; then
	let "mins=mins+1"
	let "secs=0"
	fi
done
}



function writeLog {
	L_currdate=`date +$datelogFormat`
	L_stopTime=`date +$hourlogFormat`
	echo $L_currdate\; $L_startTime\; $L_stopTime\; $L_tag\; $L_comment\; $L_mode;
}

function quit {
    if [ $isInBreak -eq 1 ]; then exit 0; fi
	echo "type a comment about session : "; read L_comment
	#if [[ $message == "CANCEL" ]]; then exit 1; fi
	writeLog >> $pomodoroLogFile

    if [ $autoBreakFlag -eq 1 ] && [ $chronometerFlag -eq 0 ]
    then
        breakTimer
	fi

	exit 0
}

function breakTimer {
    isInBreak=1
	timer $pomodoroBreakMinutes
    breakEndEvent
}

function breakEndEvent {
    if [ $notificationFlag -eq 1 ]; then
        osascript -e "display notification \"$BreakEndMessage\" with title \"Potato\""
    fi
    if [ $sayFlag -eq 1 ]; then say $BreakEndMessage; fi
}

function workEndEvent {
    if [ $notificationFlag -eq 1 ]; then
        osascript -e "display notification \"$WorkEndMessage\" with title \"Potato\""
    fi
    if [ $sayFlag -eq 1 ]; then say $WorkEndMessage; fi
}
: '
function parseLastSession {
	P_line=`cat $pomodoroLogFile | tail -n 1`
	P_date=`echo $P_line | cut -d";" -f1`
	P_startTime=`echo $P_line | cut -d";" -f2`
	P_endTime=`echo $P_line | cut -d";" -f3`
	P_tag=`echo $P_line | cut -d";" -f4`
	P_comment=`echo $P_line | cut -d";" -f5`
	P_mode=`echo $P_line | cut -d";" -f6`
}

function manualMod{
	parseLastSession
	L_startTime=$P_startTime
	L_mode="M"
}
'
function parseArguments {
    while getopts "hvcbt" opt;
    do
        case "$opt" in
        h)
            echo "Help Mode - Usage"
            helpmode
            exit 2
        ;;

        t)
          	# Testing feature
			echo " Test Mode: time is shifting faster "
			pomodoroWorkMinutes=1
			pomodoroBreakMinutes=2
			secondsRefresh=1
        ;;

		v)
			# Verbose Mode

		;;

        c)
            # Chronometer mode on
            chronometerFlag=1
        ;;

        b)
            # Chronometer mode on
            autoBreakFlag=1
        ;;
		
		m)
			#manual mod
			manualModFlag=1
		;;

        esac
done
}

function helpmode {
    echo "Potato - Simple pomodoro timer, and time loger"
    echo "Usage:"
    echo "simply run potato script and let the magic begin"
    echo "Options:"
    echo "-c: Chronometer Mode: For recording events without time limit"
    echo "-b: autobreak mode: For counting break time after each pomodoro session"
    echo "\>\$: potato project1 command simply runs a pomodoro session and tags it as project1"
    echo "After each session, optional short note for work track"
    echo "ctrl+z key shortcut is for pause session, for both chronometer and timer mode"
    echo "use fg command to resume session"
    echo "press ctrl+c is for breaking session and record it with custom message(optional)"
    echo "to not record a session into log press ctrl+d in message input "
}


main $@
