      ******************************************************************
      * Author:Soomin Lee 040899389 Section 304
      * Date:17-Jan-2023
      * Purpose:record student's information
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LAB2.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT
           ASSIGN TO "\Student.txt".
       DATA DIVISION.
       FILE SECTION.
       FD STUDENT.
       01 STUDENT-FILE.
           05 STUDENT-ID PIC A(10).
           05 STUDENT-PROGRAM PIC A(8).
           05 STUDENT-YEAR PIC 9(6).
           05 STUDENT-DATA.
               10 STUDENT-NAME.
                   20 TITLE PIC A(6).
                   20 FIRST-NAME PIC A(15).
                   20 NAME-INITIAL PIC A(2).
                   20 LAST-NAME PIC A(28).
               10 STUDENT-ADDRESS.
                   20 STREET PIC A(25).
                   20 CITY PIC A(15).
                   20 PROVINCE PIC A(15).
                   20 POSTAL-CODE PIC A(7).

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM LAB2.
