      ******************************************************************
      * Author: Soomin Lee CST8283 304
      * Date: 07-FEB-2023
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-RECORD
           ASSIGN TO "..\Student-record.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-RECORD.
       01 STUDENT-RECORD-IN.
           05 STUDENT-NUM PIC 9(7).
           05 TUITION-OWED PIC 9(5).
           05 STUDENT-NAME PIC X(40).

       WORKING-STORAGE SECTION.
       01 STUDENT-RECORD-OUT-FORMATTED.
           05 STUDENT-NUM-OUT      PIC 9(5).
           05 FILLER               PIC X(5) VALUE SPACES.
           05 TUITION-OWED-OUT     PIC 9(5).
           05 FILLER               PIC X(5) VALUE SPACES.
           05 STUDENT-NAME-OUT     PIC A(40).

       01 WS-EOF PIC A(1).
       01 ANSWER PIC A(1).
       01 COUNTER PIC 9(10) VALUES 0.

       PROCEDURE DIVISION.
       101-PRODUCE-STUDENT-RECORD.
       PERFORM 201-INITIATE.
       PERFORM 202-PROCESS-ONE-STUDENT.
       PERFORM 203-CLOSE-FILE.
       STOP RUN.

           201-INITIATE.
               PERFORM 302-OPEN-FILE.

           202-PROCESS-ONE-STUDENT.
               PERFORM 303-ACCEPT-DATA.
               PERFORM 304-WRITE-DATA UNTIL ANSWER='q'.
               PERFORM 301-CONTINUE-OR-NOT.

           203-CLOSE-FILE.
               CLOSE STUDENT-RECORD.

               301-CONTINUE-OR-NOT.
                  IF COUNTER = 0
                     THEN  DISPLAY "Continue? (q for quit, y for yes)"
                         ACCEPT ANSWER
                         IF ANSWER = 'y'
                           THEN MOVE 1 TO COUNTER
                         END-IF
                  END-IF.

               302-OPEN-FILE.
                   OPEN OUTPUT STUDENT-RECORD.

               303-ACCEPT-DATA.
                   DISPLAY "PLEASE ENTER STUDENT NUMBER:".
                   ACCEPT STUDENT-NUM.
                   DISPLAY "PLEASE ENTER TUITION OWED:".
                   ACCEPT TUITION-OWED.
                   DISPLAY "PLEASE ENTER STUDENT NAME:".
                   ACCEPT STUDENT-NAME.

               304-WRITE-DATA.
                   MOVE STUDENT-NUM TO STUDENT-NUM-OUT.
                   MOVE TUITION-OWED TO TUITION-OWED-OUT.
                   MOVE STUDENT-NAME TO STUDENT-NAME-OUT.

                   WRITE STUDENT-RECORD-IN
                     FROM STUDENT-RECORD-OUT-FORMATTED
                       AFTER ADVANCING 2 LINE.

       END PROGRAM PROJECT01.
