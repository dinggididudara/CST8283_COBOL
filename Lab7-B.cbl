      ******************************************************************
      * Author: SOOMIN LEE 040899389 CST8283 304
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB7-B.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 CLIENT-INFORMATION.
           05 CLIENT-NAME PIC X(25).
           05 CLIENT-ADDRESS PIC X(40).
       01 NUMBER-LABELS PIC 9(3).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "ENTER YOUR NAME: "
           ACCEPT CLIENT-NAME.
           DISPLAY "ENTER YOUR ADDRESS: "
           ACCEPT CLIENT-ADDRESS.


           DISPLAY "ENTER THE NUMBER OF LABELS TO PRINT: "
           ACCEPT NUMBER-LABELS.

           PERFORM PRINT-LABELS.

            STOP RUN.

            PRINT-LABELS.
      *          DISPLAY "PRINT " NUMBER-LABELS "LABELS FOR "
      *          CLIENT-NAME " AT "CLIENT-ADDRESS.
       END PROGRAM LAB7-B.
