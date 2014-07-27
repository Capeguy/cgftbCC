-- This is the first time setup so the computer will
-- Download all the required scripts.
running = true
-- Checking System Support
if not http then
  error "You Must Enable HTTP In Computer-craft Con-figs To Use The System!"
end
 
if pocket then
  error "Sorry, The Software Does Not Support Pocket Computer!"
end
 
if not term.isColor() then
  error "This Computer Does Not Appear To Be Advanced, If It Is Advanced, Then Please Report This"
end
 
function PrintCentered(text, y)
    term.setTextColor(1)
        local w, h = term.getSize()
    x = math.ceil(math.ceil((w / 2) - (#text / 2)), 0)+1
    term.setCursorPos(x, y)
        term.clearLine()
    write(text)
end
 
function initBackground(color) --Draw The Background In The Specified Color
  term.setBackgroundColor(color)
  term.clear()
end
 
function drawTitleBar()
  term.setBackgroundColor(128)
  term.setCursorPos(1,1)
  term.clearLine()
  term.setTextColor(colors.cyan)
  write "HbombOS Security Solutions"
  term.setCursorPos(1,2)
  term.clearLine()
  term.setTextColor(256)
  write "Installer"
  term.setTextColor(1)
end
 
initBackground(256)
drawTitleBar()
 
local function checkSite()
  local response = http.get("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/version")
  if response then
    return true
  else
    return false
  end
end
   
function open()
term.setBackgroundColor(256)
term.setTextColor(1)
  PrintCentered("Hello And Welcome To The", 4)
  PrintCentered("HbombOS Security Suite", 5)
  PrintCentered("Installer", 6)
  PrintCentered("Press Any Key To Begin", 18)
  os.pullEvent("key")
  PrintCentered("Setting Up Preferences", 18)
  sleep(0)
  PrintCentered("Reading GitHub Repository", 18)
  if not checkSite() then
    PrintCentered("The GitHub Version File Does Not", 18)
    PrintCentered("Appear To Be At The Destination URL", 19)
        term.setTextColor(colors.red)
        PrintCentered("The Installer Has Encountered An Issue!", 2)
        return false
  end
  PrintCentered("GitHub Repository Located", 18)
  sleep(1)
  PrintCentered("GitHub Repository Connection Established", 18)
  sleep(1)
  PrintCentered("BEWARE All Files That Have The Same Path", 8)
  PrintCentered("Will Be Overwritten!", 9)
  PrintCentered("Press 'Y' To Continue, Else Cancel", 10)
  PrintCentered("Waiting For Prompt", 18)
  event, key = os.pullEvent("key")
    if key == keys.y then
          PrintCentered("Prompt Received, Continuing", 18)
          sleep(0)
          PrintCentered("Starting Download Sequence", 18)
          sleep(0.1)
          return true
        else
          PrintCentered("Cancelling Download, Aborting Installer", 18)
          sleep(0)
          return false
        end
end
 
function downloadFiles(getUrl, toPath)
term.setTextColor(1)
term.setBackgroundColor(256)
-- Download the files and scripts from github
  for i = 1, 3 do
    local response = http.get(getUrl)
        if response then
          data = response.readAll()
              if fs.exists(toPath) then
                  fs.delete(toPath)
                  PrintCentered ("Delete: "..toPath, 19)
          sleep(0.1)
                end
                if toPath then
                  local file = io.open(toPath, "w")
                  file:write(data)
                  file:close()
                  PrintCentered ("Download: "..toPath, 19)
                  sleep(0)
                  return true
                else
                  error "We Believe The Path Specified Is Invalid, Report If Not Your Fault"
                end
        else
          error ("The File Or Files At: "..getUrl.." Do Not Appear To Exist! Please Report This Issue On Forums Or Through GitHub")
        end
  end
  error ("Failed To Download The File From URL: "..getUrl.." Please try again later, If this is the 2nd time you've seen this, then report it on the fourms")
end
 
function wait()
  while true do
  sleep(0)
  end
end
 
function stop()
runningStart = false
y = "stop"
sleep(0)
y = "stop"
end
 
function waitForKey(key)
  os.pullEvent("key")
end
 
function rebootCountdown()
  for x=10, 0, -1 do
    PrintCentered("Force Reboot In: "..x, 19)
    sleep(1)
  end
end
 
function thank()
  stop()
  local f = fs.open("version", "r")
  vCurrent = f.readLine()
  f.close()
  term.clear()
  drawTitleBar()
  term.setBackgroundColor(256)
  PrintCentered("Thank You For Installing The Latest Stable Build", 4)
  PrintCentered("Your Use Of This Program Is Much Appreciated", 5)
  PrintCentered("Report Any Bugs You Find", 7)
  PrintCentered("Avoid Posting If Already Reported", 8)
  sleep(0)
  PrintCentered("Thanks Again, Hope You Enjoy", 10)
  PrintCentered("Your Version: "..vCurrent.."", 12)
  PrintCentered("Please Press Any Key To Reboot This PC Or Wait", 18)
  parallel.waitForAny(waitForKey, rebootCountdown)
  PrintCentered("Rebooting..", 19)
  sleep(2)
  os.reboot()
end
 
function download()
term.setBackgroundColor(256)
PrintCentered ("Downloading Scripts... Please Wait", 19)
sleep(1)
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/startup", "startup")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/version", "version")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Install/installer", "systemFiles/Install/installer")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Install/updater", "systemFiles/Install/updater")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/BootLogos/boot0.nfp", "systemFiles/BootLogos/boot0.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/systemFiles/BootLogos/boot1.nfp", "systemFiles/BootLogos/boot1.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/systemFiles/BootLogos/boot2.nfp", "systemFiles/BootLogos/boot2.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/systemFiles/BootLogos/boot3.nfp", "systemFiles/BootLogos/boot3.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/BootLogos/boot4.nfp", "systemFiles/BootLogos/boot4.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/BootLogos/boot5.nfp", "systemFiles/BootLogos/boot5.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/BootLogos/boot6.nfp", "systemFiles/BootLogos/boot6.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/BootLogos/boot7.nfp", "systemFiles/BootLogos/boot7.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/BootLogos/boot8.nfp", "systemFiles/BootLogos/boot8.nfp")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/bootFail.nfp", "systemFiles/bootFail.nfp")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/api/download", "/api/download")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/api/systemCheck", "/api/systemCheck")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/api/update", "/api/update")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/api/printer", "/api/printer")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/api/titleBar", "/api/titleBar")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/api/errora", "/api/errora")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/README", "/Documentation/README")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/LICENSE", "/Documentation/LICENSE")
downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/FirstInstallScript.lua", "/Documentation/FirstInstallScript.lua")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Programs/dualKey", "/systemFiles/Programs/dualKey")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Programs/keycard", "/systemFiles/Programs/keycard")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Programs/keycardDual", "/systemFiles/Programs/keycardDual")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Programs/pin", "/systemFiles/Programs/pin")
--downloadFiles("https://raw.githubusercontent.com/Capeguy/cgftbCC/master/systemFiles/Programs/reactor", "/systemFiles/Programs/reactor")
PrintCentered("Complete", 19)
sleep(1)
term.clear()
stop()
thank()
end
 
if open() then
--parallel.waitForAny(download, wait)
stop()
download()
end