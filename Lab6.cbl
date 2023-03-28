      ******************************************************************
      * Author: Soomin Lee section 304
      * Date:
      * Purpose: read the car file -> write into table -> read file again ...
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB6.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT CAR-FILE
             ASSIGN "..\CARFILE.DAT"
            ORGANIZATION IS LINE SEQUENTIAL.
.
       DATA DIVISION.
       FILE SECTION.
       FD CAR-FILE.
       01 CAR-FILE-TABLE OCCURS 200 TIMES.
           05 CAR-TYPE PIC X(5).
           05 CAR-YEAR PIC 9(4).
           05 ENGINE-SIZE PIC 9(1).
       01 CAR-OUT.
           05 CAR-TYPE-OUT PIC X(5).
           05 CAR-YEAR-OUT PIC 9(4).
           05 ENGINE-SIZE-OUT PIC 9(1).

       WORKING-STORAGE SECTION.
       01 EOF-FLG PIC X.
       01 ANSWER PIC A(1) VALUE 'A'.
       01 SUB-1 PIC 9(3) VALUE ZERO.

       01 CAR-RECORD-IN.
           05 CAR-TYPE-IN PIC X(5).
           05 CAR-YEAR-IN PIC 9(4).
           05 ENGINE-SIZE-IN PIC 9(1).

       PROCEDURE DIVISION.
       100-MAIN-PROCEDURE.
           PERFORM 201-INITIATE-FILE.
           PERFORM 202-WRITE-RECORD
               VARYING SUB-1 FROM 1 BY 1 UNTIL ANSWER = 'Q'.
           PERFORM 203-CLOSE-FILE.
           STOP RUN.

           201-INITIATE-FILE.
               OPEN OUTPUT CAR-FILE.

           202-WRITE-RECORD.
               PERFORM 303-ACCEPT-DATA.
               PERFORM 304-WRITE-DATA-TABLE.
               PERFORM 301-CONTINUE-OR-NOT.

           203-CLOSE-FILE.
               CLOSE CAR-FILE.

               301-CONTINUE-OR-NOT.
                  DISPLAY "Continue? (Q for quit, Y for yes)"
                  ACCEPT ANSWER.

               302-OPEN-FILE.
                  OPEN OUTPUT CAR-FILE.

               303-ACCEPT-DATA.
                   DISPLAY "PLEASE ENTER CAR TYPE:".
                   ACCEPT CAR-TYPE-IN.

                   DISPLAY "PLEASE ENTER CAR YEAR:".
                   ACCEPT CAR-YEAR-IN.

                   DISPLAY "PLEASE ENTER ENGINE SIZE:".
                   ACCEPT ENGINE-SIZE-IN.

               304-WRITE-DATA-TABLE.
                   ADD 1 TO SUB-1.
                   MOVE CAR-TYPE-IN TO CAR-TYPE(SUB-1) CAR-TYPE-OUT.
                   MOVE CAR-YEAR-IN TO CAR-YEAR(SUB-1) CAR-YEAR-OUT.
                   MOVE ENGINE-SIZE-IN
                   TO ENGINE-SIZE(SUB-1) ENGINE-SIZE-OUT.

                   WRITE CAR-OUT.

       END PROGRAM LAB6.
