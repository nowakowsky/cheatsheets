### easy set up vnc server, works on debian based distros
[based on this high quality guide](https://www.howtoforge.com/tutorial/how-to-start-a-vnc-server-for-the-actual-display-scraping-with-tigervnc/)


1. Get server
    * apt install tigervnc-scraping-server

2. Create dir and set password
    * mkdir ~/.vnc
    * vncpasswd

3. Get startvnc script
    * [original by sebestyenistvan](https://github.com/sebestyenistvan/runvncserver/blob/master/startvnc)
    * [short version](https://github.com/nowakowsky/cheatsheets/blob/main/startvnc)

4. Add execute premission
    * chmod +x ~/startvnc

5. Set autorun
    * echo "/home/username/startvnc start >/dev/null 2>&1" >> ~/.xsessionrc
