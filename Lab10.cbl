      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Lab10.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 SHOES.
           05 SHOE-STYLE-WS PIC X(5).
           05 SHOE-SIZE-WS PIC X(4).

       SCREEN SECTION.
       01 SHOE-SCREEN.
           05 VALUE "YOUR SHOES" BLANK SCREEN LINE 1 COL 15.
           05 VALUE "ENTER SHOE STYLE: " LINE 5 COL 5.
           05 SHOE-STYLE-IN LINE 5 COL 25
                   PIC X(5) TO SHOE-STYLE-WS.
           05 VALUE "ENTER SHOE SIZE: " LINE 7 COL 5.
           05 SHOE-SIZE-IN LINE 7 COL 25
                   PIC X(4) TO SHOE-SIZE-WS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            ACCEPT SHOE-SCREEN.
            DISPLAY SHOE-SCREEN.

            STOP RUN.
       END PROGRAM Lab10.
