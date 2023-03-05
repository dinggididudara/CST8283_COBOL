      ******************************************************************
      * Author: Soomin Lee CST8283 304
      * Date: 11-FEB-2023
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
       01 ANSWER PIC A(1) VALUE 'A'.

       PROCEDURE DIVISION.
       101-PRODUCE-STUDENT-RECORD.
       PERFORM 201-INITIATE.
       PERFORM 202-PROCESS-ONE-STUDENT UNTIL ANSWER = 'Q'.
       PERFORM 203-CLOSE-FILE.
       STOP RUN.

           201-INITIATE.
               PERFORM 302-OPEN-FILE.

           202-PROCESS-ONE-STUDENT.
               PERFORM 303-ACCEPT-DATA.
               PERFORM 304-WRITE-DATA.
               PERFORM 301-CONTINUE-OR-NOT.

           203-CLOSE-FILE.
               CLOSE STUDENT-RECORD.

               301-CONTINUE-OR-NOT.
                  DISPLAY "Continue? (Q for quit, Y for yes)"
                  ACCEPT ANSWER.

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
                   WRITE STUDENT-RECORD-IN
                   AFTER ADVANCING 2 LINES.

           END PROGRAM PROJECT01.
