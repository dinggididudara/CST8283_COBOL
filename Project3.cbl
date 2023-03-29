      ******************************************************************
      * Author: Soomin Lee 040899389
      * Date: April-3
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
        IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT03.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE
           ASSIGN TO "..\STUFILE3.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT PROGRAM-FILE
           ASSIGN TO "..\PROGRAM.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT STUDENT-REPORT
           ASSIGN TO "..\STUDENT-RECORD.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
      * PROGRAM.TXT
       FD PROGRAM-FILE.
       01 PROGRAM-FILE-IN.
         10 PROGRAM-CODE PIC X(5).
         10 PROGRAM-NAME PIC X(20).
      * STUFILE.TXT
       FD STUDENT-FILE.
       01 STUDENT-FILE-IN.
         05 STUDENT-NUMBER PIC 9(6).
         05 TUITION-OWED PIC 9999V99.
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

       FD STUDENT-REPORT.
       01 STUDENT-REPORT-OUT.
         05 STUDENT-INFO-OUT.
           10 STUDENT-NAME-OUT PIC X(40).
           10 FILLER PIC X(2) VALUE SPACE.
           10 STUDENT-AVERAGE-OUT PIC 9(3).
           10 FILLER PIC X(4) VALUE SPACE.
           10 PROGRAM-NAME-OUT PIC X(20).
           10 FILLER PIC X(4) VALUE SPACE.
           10 TUITION-OWED-OUT PIC ZZZZ.99.

      * format for column header
       01 COLUMN-HEADER.
         05 NAME-HEADER PIC X(38).
         05 FILLER PIC X(2).
         05 AVERAGE-HEADER PIC X(10).
         05 FILLER PIC X(4).
         05 PROGRAM-HEADER PIC X(12).
         05 FILLER PIC X(4).
         05 TUITION-OWED-HEADER PIC X(14).
      * final report that writing total number of read/write
       01 FINAL-REPORT.
         05 FINAL-REPORT-1 PIC X(32).
         05 FINAL-NUMBER-1 PIC Z9.
         05 FILLER PIC X(7).
         05 FINAL-REPORT-2 PIC X(32).
         05 FINAL-NUMBER-2 PIC Z9.

       WORKING-STORAGE SECTION.
      * table for code and name for using in this file
       01 PROGRAM-FILE-CONTAINER.
         05 PROGRAM-TABLE-CONTAINER OCCURS 20 TIMES.
           10 PROGRAM-CODE-CONTAINER PIC X(5).
           10 PROGRAM-NAME-CONTAINER PIC X(20).

       01 EOF-FLG PIC X(1).
       01 STUDENT-AVERAGE PIC 9(3).
       01 COURSE-TOTAL PIC 9(3).
      * counter for total number of read/write
       01 COUNTERS.
         05 HOW-MANY-READ PIC 9(2) VALUE 0.
         05 HOW-MANY-WRITE PIC 9(2) VALUE 0.
      * table varies - searching for the code
       01 TABLE-VARIBLES.
         05 TABLE-EOF PIC X(3).
         05 TABLE-COUNTER-1 PIC 9(2).
         05 TABLE-COUNTER-2 PIC 9(2).
         05 CODE-FOUND PIC X(3).

       SCREEN SECTION.
       01 UPDATE-DATA-SCREEN.
           05 VALUE "**UPDATING DATA SCREEN**" LINE 1 COL 1.
           05 VALUE "STUDENT ID: " LINE 2 COL 1.
           05 STUDENT-NUMBER PIC 9(9) TO STUDENT-NUMBER-WS.

       PROCEDURE DIVISION.
      * main procedure
       100-PRODUCE-STUDENT-REPORT.
           PERFORM 200-INITIALIZE.

           PERFORM UNTIL EOF-FLG = 'Y'
               PERFORM 201-READ-STUDENT-FILE
               PERFORM 303-CALCULATE

               PERFORM 304-CODE-SEARCH
                 VARYING TABLE-COUNTER-2 FROM 1 BY 1
                 UNTIL CODE-FOUND = 'Y'
                 OR TABLE-COUNTER-2 = 20

               MOVE 'N' TO CODE-FOUND

               IF EOF-FLG IS NOT EQUAL 'Y'
                   PERFORM 305-WRITE-STUDENT-REPORT
                   ADD 1 TO HOW-MANY-READ
               END-IF

           END-PERFORM

           MOVE "RECORD READS: " TO FINAL-REPORT-1.
           MOVE HOW-MANY-READ TO FINAL-NUMBER-1.
           MOVE " RECORD WRITTEN: " TO FINAL-REPORT-2.
           MOVE HOW-MANY-WRITE TO FINAL-NUMBER-2.

           WRITE FINAL-REPORT.

           PERFORM 202-CLOSE-FILE.
           STOP RUN.
      * save the column name and write into report
       200-INITIALIZE.
           MOVE "NAME" TO NAME-HEADER.
           MOVE "AVERAGE" TO AVERAGE-HEADER.
           MOVE "PROGRAM" TO PROGRAM-HEADER.
           MOVE "TUITION" TO TUITION-OWED-HEADER.
           PERFORM 200-OPEN-FILE.
           PERFORM 301-CONVERT-TO-INDEXED-FILE.
           PERFORM 301-READ-TABLE.
           WRITE STUDENT-REPORT-OUT.
           PERFORM 302-RESET-COLUMN-HEADER.
      * reading student file until end of file
       201-READ-STUDENT-FILE.
           READ STUDENT-FILE INTO STUDENT-FILE-IN
               AT END
                   MOVE 'Y' TO EOF-FLG
           END-READ.
      * close all files
       202-CLOSE-FILE.
           CLOSE PROGRAM-FILE.
           CLOSE STUDENT-FILE.
           CLOSE STUDENT-REPORT.
      * open all files
           200-OPEN-FILE.
               OPEN INPUT PROGRAM-FILE.
               OPEN INPUT STUDENT-FILE.
               OPEN OUTPUT STUDENT-REPORT.
      * convert student.txt file to indexed file
           301-CONVERT-TO-INDEXED-FILE.


      * reading the table and increment the counter
           301-READ-TABLE.
               PERFORM LOAD-TABLE
                VARYING TABLE-COUNTER-1 FROM 1 BY 1
               UNTIL TABLE-COUNTER-1 IS EQUAL TO 20
               OR TABLE-EOF IS EQUAL TO 'Y'.
      *  loading the table routine
               LOAD-TABLE.
               READ PROGRAM-FILE
                 AT END
                     MOVE 'Y' TO TABLE-EOF
                NOT AT END
                    MOVE PROGRAM-FILE-IN
                       TO PROGRAM-TABLE-CONTAINER(TABLE-COUNTER-1).
      * reset the column header for report
           302-RESET-COLUMN-HEADER.
               MOVE " " TO NAME-HEADER.
               MOVE " " TO AVERAGE-HEADER.
               MOVE " " TO PROGRAM-HEADER.
               MOVE " " TO TUITION-OWED-HEADER.
      * calculate average and save
           303-CALCULATE.
               INITIALIZE COURSE-TOTAL.

               ADD COURSE-AVERAGE-1 COURSE-AVERAGE-2 COURSE-AVERAGE-3
               COURSE-AVERAGE-4 COURSE-AVERAGE-5 TO COURSE-TOTAL.

               DIVIDE 5 INTO COURSE-TOTAL
               GIVING STUDENT-AVERAGE ROUNDED.

      * searching program code for each student
           304-CODE-SEARCH.
               MOVE 'N' TO CODE-FOUND.
           IF PROGRAM-OF-STUDY = PROGRAM-CODE-CONTAINER(TABLE-COUNTER-2)
               MOVE PROGRAM-NAME-CONTAINER(TABLE-COUNTER-2) TO
                 PROGRAM-NAME-OUT
               MOVE 'Y' TO CODE-FOUND.
      * writing the student report
           305-WRITE-STUDENT-REPORT.
               MOVE STUDENT-NAME TO STUDENT-NAME-OUT.
               MOVE STUDENT-AVERAGE TO STUDENT-AVERAGE-OUT.
               MOVE TUITION-OWED TO TUITION-OWED-OUT.

               WRITE STUDENT-REPORT-OUT.

           END PROGRAM PROJECT03.
