# auth-script
Use it to authenticate for internet access on IITG network. Useful for systems with only SSH access (SSH tunnels are blocked on institute network) 

### Note:
The script can reconnect automatically but it may take time.

On a normal disconnect (power cut or system put on sleep) it can take upto 3 minutes. In other cases it may take more time, manually disconnecting and reconnecting is advised in such cases.
  
  
## Instructions (For linux based systems)
* Download ```script.sh```
* Open the file and replace ```uname``` and ```passwd``` in the file with your username and password
* Make it executable with the following command
```
chmod +x script.sh
```
* Execute the file:
```
./script.sh
```

After first time setup is done, only the last command is needed for subsequent uses


### The script authenticates every 500 seconds and stops when authentication fails. Just open another terminal and use it normally. 
### To keep using the same terminal send this script to background with the following steps:


1. Start the script normally:
```
./script.sh
```
2. Pause it by pressing ```Ctrl+Z```
3. Move it to background and resume by typing 
```
bg
```


To bring it back to foreground type:
```
fg
```
There are better methods but this is the simplest one of them
