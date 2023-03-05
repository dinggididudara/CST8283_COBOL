      ******************************************************************
      * Author: Soomin 304
      * Date: Mar-06
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT02.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-RECORD
           ASSIGN TO "..\STUFILE.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PROGRAM-RECORD
           ASSIGN TO "..\PROGRAM.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT STUDENT-RECORD-OUT
           ASSIGN TO "..\STUDENT-RECORD.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-RECORD.
       01 STUDENT-RECORD-IN.
           05 STUDENT-NUM PIC 9(6).
           05 TUITION-OWED PIC 99999V99.
           05 STUDENT-NAME PIC X(40).
           05 PROGRAM-OF-STUDY PIC X(5).
           05 COURSE-CODE-1 PIC X(7).
           05 COURSE-AVERAGE-1 PIC 9(3).
           05 COURSE-CODE-2 PIC X(7).
           05 COURSE-AVERAGE-2 PIC 9(3).
           05 COURSE-CODE-3 PIC X(7).
           05 COURSE-AVERAGE-3 PIC 9(3).
           05 COURSE-CODE-4 PIC X(7).
           05 COURSE-AVERAGE-4 PIC 9(3).
           05 COURSE-CODE-5 PIC X(7).
           05 COURSE-AVERAGE-5 PIC 9(3).
       FD STUDENT-RECORD-OUT.
        01 STUDENT-REPORT-OUT.
           05 FILLER PIC X(3) VALUES SPACES.
           05 STUDENT-AVERAGE-OUT PIC 9(3).
           05 FILLER PIC X(4) VALUES SPACES.
           05 PROGRAM-NAME-OUT PIC X(7).
           05 FILLER PIC X(4) VALUES SPACES.
           05 TUITION-OWED-OUT PIC 9(6).
       01 CLOUMN-HEADER.
           05 NAME-HEADER PIC X(38).
           05 FILLER PIC X(2).
           05 AVERAGE PIC X(10).
           05 FILLER PIC X(4).
           05 PROGRAM-HEADER PIC X(12).
           05 FILLER PIC X(4).
           05 TUITION-OWED-HEADER PIC X(12).

       WORKING-STORAGE SECTION.
       01 ANSWER PIC A(1) VALUE 'A'.
       01 STUDENT-AVERAGE PIC 9(3).

       01 PROGRAM-RECORD-TABLE.
           05 PROGRAM-TABLE OCCURS 20 TIMES.
               10 PROGRAM-CODE PIC X(5).
               10 PROGRAM-NAME PIC X(20).

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
               CLOSE PROGRAM-RECORD.
               CLOSE STUDENT-RECORD-OUT.

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

               305-CALCULATE.
                   ADD COURSE-AVERAGE-1 COURSE-AVERAGE-2
                   COURSE-AVERAGE-3 COURSE-AVERAGE-4 TO COURSE-AVERAGE-5

                   DIVIDE 5 INTO COURSE-AVERAGE-5 ROUNDED.

                   MOVE COURSE-AVERAGE-5 TO STUDENT-AVERAGE-OUT.

           END PROGRAM PROJECT02.
