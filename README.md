# potato
simple pomodoro program with time tracking feature 

## pomodoro
pomodoro is a time management technique. In a short description: you work for 25 minutes and then have a short 5 minutes break. Repeat this seasons four times and have a long break about 25 minutes. For a detail explanation about pomodoro check out this [wikipedia page](https://en.wikipedia.org/wiki/Pomodoro_Technique)

## about potato
potato is simple pomodoro program which helps you to measure pomodoro seasons. In addition you can track your other activities such as meeting, skype calls etc. with simple chronometer feature. potato logs date and time details about each season which makes it useful for daily log your activities

## compatibility
potato is using apple notifications so only works with macOS versions. 

## installation 
Just open a terminal session and type these commands
> cd
> git clone https://github.com/vegadj/potato
> chmod u+x $HOME/potato/potato.sh
> echo 'alias "potato=$HOME/potato/potato.sh"' > .profile

## configuration
potato configuration is very easy. Just open the main script with your favourite text editor and customise predefined settings for you purpose 

## running potato
for your each event you have to re-run potato. potato has two level session categorizer. you can tag your session passing single string while executing. Example:

> potato Project
> potato "Programming Homework"

After session time finished, potato will ask you a comment of your sesion for tracking what you did in that session. You can always hit enter to pass it empty. 

## logging profile
potato logs session into a csv file, which can easy read and write with spreadsheet softwares as well as text editors. You can analyse your logs with your favourite tool. 

## cloud support
with a help of cloud storage, you can use potato with different computers with logging into cloud folder.

## chronometer feature
If you want to track a event without a pomodoro, such as meeting, skype call, presentation, etc. you can use chronometer function. 
Simply use `-c` flag when executing potato
> potato -c "presentation"

you can stop chronometer by hitting `ctrl+c` and record the event with a note.

## pausing 
with magic of shell, you can pause potato with `ctrl+z` and resume by typing `fg`

## breaking
to save a season without waiting time out hit `ctrl+c` to break the timer and record it with your message

## cancelling
if you want to cancel a session (aka. not record it into log) hit `ctrl+d` when message input requires. 
