cgftbCC
=======

ComputerCraft programs for the cgftb server


**First install instructions**


On a CC Computer, run the shell command


```
"pastebin run yVbizg0A"
```


and then follow the instructions


**Update Instructions**


If a new file was to be added, edit the file in /systemFiles/Install/updater under the downloader function (line 75)


add a line:


```lua
download.git("[raw link to git file]", "[location to place in CC com]")
```


Make sure that whenever a change is made in the version file (/version), edit the 1st line and increment the digit by 1.


For eg. Major update, increment the 1st number (0.0.0.1 -> 1.0.0.0), Minor update increment 2nd number (0.0.0.1 -> 0.1.0.0)


Bug Fixes increment 3rd number (0.0.0.1 -> 0.0.1.0) and tests increment the 4th number (0.0.0.1 -> 0.0.0.2)