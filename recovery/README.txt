
This application demonstrates how to recover login passwords for Internet Explorer 6, 7, 8 and 9.
If you want to compile exe, you'll need visual studio with ATL.

     cl /O1 /Os /Oy /GS- ie_decode.cpp

Although this tool will generate a list of URL from cache in order to recover passwords,
more effective recovery can be achieved from generating a list of common URLs for 
logins and place them in "urls.txt" which ie_decode will automatically read.

