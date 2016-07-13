
This application demonstrates how to recover autocomplete passwords for
Google Chrome web browser.

If you want to compile the exe yourself, you'll need visual studio.
Although untested, Mingw should work fine also with some minor changes.
The steps to compile with VS.

  1) Download SQLITE3 amalgamation sources 
    (http://www.sqlite.org/download.html) and extract.
  2) Drop into visual studio command prompt and switch to sqlite3 folder.
  3) Build the static library with the following commands.

     cl /O1 /Os /Oy /GS- sqlite3.c /c
     lib sqlite3.obj /out:sqlite3.lib
  
  4) copy sqlite3.lib and sqlite3.h into same folder as chrome_decode.cpp 
     and build

     cl /O1 /Os /Oy /GS- chrome_decode.cpp
    