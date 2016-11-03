# potato
simple time tracking tool with a pomodoro time management technique support. works on macOS terminal

## about potato
potato is simple time tracking program which helps you to log your activities with date and hour. In addition you can record your pomodoro seasons for your creativity works. Each record is named as season. And there are two season methods: timer and choronometer. For timer mode (pomodoro mode), you season gives alert after time is up. and record will generated after you commit a short note. You can track your other activities with out specific time limit, such as meeting, skype calls etc. with chronometer feature. 

## pomodoro
pomodoro is a simple time management technique. 
There are six steps in the technique:

1. Decide on the task to be done.
2. Set the pomodoro timer (traditionally to 25 minutes).[1]
3. Work on the task until the timer rings. If a distraction pops into your head, write it down, but immediately get back on task.
4. After the timer rings, put a checkmark on a piece of paper.[7]
5. If you have fewer than four checkmarks, take a short break (3–5 minutes), then go to step 1.
6. After four pomodoros, take a longer break (15–30 minutes), reset your checkmark count to zero, then go to step 1.

[ref: wikipedia page](https://en.wikipedia.org/wiki/Pomodoro_Technique)



## compatibility
potato is using apple notifications feature,  so only works with macOS versions. 

## installation 
Just open a terminal session and type these commands

	cd
	git clone https://github.com/vegadj/potato
	chmod u+x $HOME/potato/potato.sh
	echo 'alias "potato=$HOME/potato/potato.sh"' > .profile

## configuration
potato configuration is very easy. Just open the main script you have downloaded with your favourite text editor and customise predefined settings for you purpose .

## running potato
You can run potato in a terminal window. Using a separate window just for tomato can be useful. 
for your each season you have to re-run potato program. potato has two level session categoriser. you can tag your session passing single string while executing. Example:

	potato Project
	potato "Programming Homework"

After session finished, potato will ask you a comment of your sesion for tracking what you did in that session. 

You can leave empty for both tag and comment section. 

## logging profile
potato logs session into a csv format, which can easily read and write with spreadsheet softwares as well as text editors. You can analyse your logs with your favourite tool. 

## cloud support
If you are using more than a one computer, (office, home, labtop etc.) you can sync your log file with your devices. If your config your logfiles into same file adress with a help of cloud storage, your multi computers will log into same place as excepted 

## chronometer feature
If you want to track a event without a pomodoro style (timer), such as meeting, skype call, presentation, etc. you can use chronometer function. 
Simply use `-c` flag when executing potato

	potato -c "presentation"

you can stop chronometer by hitting `ctrl+c` and record the event with a optional comment.

## auto break timer
for auto short break timer, use `-b` flag when running new session. 5 minutes timer will start after you commit your message.

## event features
Using the power of shell, we can pause, break and cancel just like normal we do in normal scripting.

### pausing 
you can pause potato with `ctrl+z` key combination and resume it just typing `fg` command.

### breaking
to save a season without waiting timer go out; press `ctrl+c` key combination. Comment option will appears and you can finish your session just like normal.

### cancelling
if you want to cancel a session (aka. not record it into log file) press `ctrl+d` when commit input requires. Program will exit immediately without logging the session. 

if you don't want to wait commit input for canceling, just break session with `ctrl+c` and cancel it by `ctrl+z` 
