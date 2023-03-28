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
           88 E VALUE 0 THRU 5.
           88 G VALUE 6 THRU 10.
           88 F VALUE 11 THRU 15.
           88 P VALUE 16 THRU 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "ENTER GAS CONSUMPTION: ".
            ACCEPT GAS.
            IF E
                MOVE 'E' TO RATING
            ELSE IF G
                MOVE 'G' TO RATING
            ELSE IF F
                MOVE 'F' TO RATING
            ELSE IF P
                MOVE 'P' TO RATING
            ELSE DISPLAY "WRONG NUMBER"
            END-IF.

            DISPLAY "RATING: " RATING.
       END PROGRAM LAB7.


      * Answer the following questions.
      *  1. What are 2 advantages of using condition name
      *  instead of full conditional statement?
      *  A: simple(readability) - easy to understand
      *     fast, resuable - can use multiple times and save time

      *  2. Can a condition name be used to check
      *    the validity of data input from a file?
      *  A: Yes, using the '88' in the data division.

      *  3. Can more than one value be used in a condition name?
      *  A: Yes, I can define multiple value.

      *  3. Can more than one range of values
      *     be checked with condition name?
      *  A: Yes, I can define multiple range like Part B.
