      ******************************************************************
      * Author: Soomin Lee 040899389 304
      * Date: Mar-10
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB7.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 RATING.
           05 GAS PIC 9(3).
           05 E PIC 9(2).
           05 G PIC 9(2).
           05 F PIC 9(2).
           05 P PIC 9(2).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "ENTER GAS CONSUMPTION: ".
            ACCEPT GAS.
            IF GAS > 0 AND GAS <= 5
                MOVE 'E' TO RATING
            ELSE IF GAS > 5 AND GAS <= 10
                MOVE 'G' TO RATING
            ELSE IF GAS > 10 AND GAS <= 15
                MOVE 'F' TO RATING
            ELSE IF GAS > 15
                MOVE 'P' TO RATING
            ELSE DISPLAY "WRONG NUMBER"
            END-IF.

            DISPLAY "RATING: " RATING.
       END PROGRAM LAB7.
