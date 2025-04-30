      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       Input-output section.
       file-control.
       select OPTIONAL polfile ASSIGN TO 'polfile.dat'
        organization is INDEXED
        ACCESS mode is RANDOM
        RECORD key is polNum1-in.
       select agent ASSIGN to 'agent.dat'
        organization is INDEXED
        ACCESS mode is RANDOM
        RECORD key is agent-in.
        select report1 assign to printer.
       DATA DIVISION.
       FILE SECTION.
       fd agent.
       01 agentrec.
       03 agent-in pic x(5).
       03 name-in pic x(15).
       fd polfile.
       01 polfilerec.
       03 polNum1-in pic x(6).
       03 polDate-in pic 9(8).
       03 polAmt-in  pic 9(8).
       03 polPrem-in pic 9(4)v99.
       03 fill pic xx.
       03 polAgent-in pic x(5).
       03 polTerm-in pic x(8).
       03 poltype-in pic x(3).
       fd report1.
       01 PRINTREC pic x(175).
       WORKING-STORAGE SECTION.
       01 polNumU-in pic x(6).
       01 choice2 pic 9(1).
       01 page-in pic 9(4).
       01 choice pic x(6).
       01 choice3 pic x(1).
       01 wsdate.
       04 yy pic 99.
       04 mm pic 99.
       04 dd pic 99.
       01 header1.
       05 MM-OUT PIC 99.
       05        PIC X VALUE "/".
       05 DD-OUT   PIC 99.
       05          PIC X VALUE  "/".
       05 YY-OUT   PIC 99.
       05          PIC X(30).
       05          PIC X(14)  VALUE "POLICY REPORT".
       05                    PIC X(10).
       05                    PIC X(5) VALUE "PAGE ".
       05 PAGE-OUT PIC  Z,ZZ9.
       05          PIC  X(10).
       05          PIC  X(15) VALUE "Joe Miloshewski".
       05          pic  X(10).
       05 name-out pic x(15).
       01 header2.
       10          PIC X(10).
       10          Value "Policy Number " pic x(15).
       10          Value "Policy Date " PIC x(13).
       10          Value "Policy Amount " pic x(14).
       10          Value "Policy Premium " pic x(15).
       10          Value "Agent " pic x(6).
       10          Value "Policy Term " pic x(12).
       10          Value "Policy Type " pic x(13).
       01 INFOLine.
       10          pic X(10).
       10          polNum1-out pic x(6).
       10          pic x(9).
       10          polDate-out pic xx/xx/xxxx.
       10          pic x(3).
       10          polAmt-out pic x(8).
       10          pic x(6).
       10          polPrem-out pic 9(4)v99.
       10          pic x(9).
       10          polAgent-out pic x(5).
       10          pic x(1).
       10          polTerm-out pic x(8).
       10          pic x(4).
       10          poltype-out pic x(3).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM 100-Open.
            PERFORM 400-Menu.
       100-Open.
           OPEN I-O polfile.
           OPEN INPUT agent.
           OPEN OUTPUT report1.
           ACCEPT WSDATE FROM DATE
           MOVE MM TO MM-OUT
           MOVE YY TO YY-OUT
           MOVE DD TO DD-OUT
           PERFORM 200-Header.
       200-Header.
           ADD 1 to page-in
           MOVE page-in to page-out
           WRITE PRINTREC FROM header1 AFTER ADVANCING PAGE.
           WRITE PRINTREC FROM header2 AFTER ADVANCING 1 LINES.
       400-Menu.
            DISPLAY "Enter ADD, UPDATE, DELETE or exit depending on"
            " what you would like to do."
            ACCEPT choice
            PERFORM UNTIL choice = "exit"
               EVALUATE choice
                   WHEN "ADD"
                       PERFORM 500-ADD
                   WHEN "UPDATE"
                       PERFORM 600-UPDATE
                   WHEN "DELETE"
                       PERFORM 700-DELETE
                   WHEN OTHER
                       PERFORM 800-ERROR
                   END-EVALUATE
                       END-PERFORM.
                           PERFORM 300-Exit.
       500-ADD.
           DISPLAY "Enter the record that you like to add in the order"
           " of policy number, policy date, policy amount, "
           "policy premium, fill, policy agent, policy term, policy"
           " type. Policy type must be either 111, 222, or 333. Make"
           "sure to press enter after entering each value.".
           ACCEPT polNum1-in.
           ACCEPT polDate-in.
           ACCEPT polAmt-in.
           ACCEPT polPrem-in.
           ACCEPT fill.
           ACCEPT polAgent-in.
           PERFORM 900-Read1.
       600-UPDATE.
           DISPLAY "Enter the policy number of the record you would "
           "like to update.".
           ACCEPT polnumU-in.
           PERFORM 1200-Read2.
       700-DELETE.
           DISPLAY "Enter the policy number of the record you would "
           "like to Delete.".
           ACCEPT polNum1-in.
           PERFORM 1900-READ4.
       1900-Read4.
           READ polfile
           INVALID KEY PERFORM 2100-Error4
           NOT INVALID KEY PERFORM 2000-DELETE2
           END-READ.
       2100-Error4.
           DISPLAY "Error Policy Number was not in file".
           ACCEPT polNum1-in.
           PERFORM 1900-Read4.
       2000-DELETE2.
           DISPLAY "Are you sure you want to DELETE record " polNum1-in
           " Enter y for yes or n for no".
           ACCEPT choice3
           if choice3 = "y"
               MOVE polNum1-in to polNum1-out.
               MOVE polDate-in to polDate-out.
               MOVE polAmt-in to polAmt-out.
               MOVE polPrem-in to polPrem-out.
               MOVE polAgent-in to polAgent-out.
               MOVE polTerm-in to polTerm-out.
               MOVE poltype-in to poltype-out.
               WRITE PRINTREC from INFOLine after ADVANCING 1 line.
               WRITE PRINTREC from "        DELETE".
               DELETE polfile.
               PERFORM 400-Menu.
           if choice3 = "n"
               PERFORM 400-Menu.
       800-ERROR.
           DISPLAY "Error choice must be ADD, UPDATE, OR DELETE".
           PERFORM 400-Menu.
       900-Read1.
           MOVE polAgent-in to agent-in
           READ agent
           INVALID KEY PERFORM 1000-Error2
           NOT INVALID KEY PERFORM 1100-ADD2
           END-READ.
       1200-Read2.
           MOVE polNumU-in to polNum1-in
           READ polfile
           INVALID KEY PERFORM 1300-Error3
           NOT INVALID KEY PERFORM 1400-UPDATE2
           END-READ.
       1000-Error2.
           DISPLAY "Error agent was not in file".
           ACCEPT polAgent-in.
           PERFORM 900-Read1.
       1300-Error3.
           DISPLAY "Error Policy Number was not in file".
           ACCEPT polNum1-in.
           PERFORM 1200-Read2.
       1400-UPDATE2.
           DISPLAY "What field would you like to update for this record"
           ". Enter 1 for policy date, Enter 2 for Policy Amount, Enter"
           " 3 f78or Policy Premium, Enter 4 for policy Agent, Enter 5 "
           "for Policy Term, Enter 7 to update the record with your new"
           "record.".
           MOVE polNum1-in to polNum1-out.
           MOVE polDate-in to polDate-out.
           MOVE polAmt-in to polAmt-out.
           MOVE polPrem-in to polPrem-out.
           MOVE polAgent-in to polAgent-out.
           MOVE polTerm-in to polTerm-out.
           MOVE poltype-in to poltype-out.
           ACCEPT choice2
           PERFORM UNTIL choice2 = 7
               EVALUATE choice2
                   WHEN 1
                       ACCEPT polDate-in
                       MOVE polDate-in to polDate-out
                       PERFORM 1500-UPDATE3
                   WHEN 2
                       ACCEPT polAmt-in
                       MOVE polAmt-in to polAmt-out
                       PERFORM 1500-UPDATE3
                   WHEN 3
                       ACCEPT polPrem-in
                       MOVE polPrem-in to polPrem-out
                       PERFORM 1500-UPDATE3
                   WHEN 4
                       ACCEPT polAgent-in
                       MOVE polAgent-in to polAgent-out
                       PERFORM 1600-Read3
                   WHEN 5
                       ACCEPT polTerm-in
                       MOVE polTerm-in to polTerm-out
                       PERFORM 1500-UPDATE3
                   WHEN 6
                       ACCEPT poltype-in
                       IF poltype-in = 111
                       ELSE IF poltype-in = 222
                       ELSE IF poltype-in = 333
                       ELSE
                           DISPLAY "Error policy type is not 111,"
                           "222, 333"
                           ACCEPT poltype-in
                       end-if
                       PERFORM 1500-UPDATE3
                   WHEN OTHER
                       PERFORM 1800-ERROR4
                   END-EVALUATE
                       END-PERFORM.
                           PERFORM 400-Menu.
       1500-UPDATE3.
           WRITE PRINTREC FROM INFOLine AFTER ADVANCING 1 Line.
           WRITE PRINTREC FROM "        UPDATE".
           MOVE polNum1-in to polNum1-out.
           MOVE polDate-in to polDate-out.
           MOVE polAmt-in to polAmt-out.
           MOVE polPrem-in to polPrem-out.
           MOVE polAgent-in to polAgent-out.
           MOVE polTerm-in to polTerm-out.
           MOVE poltype-in to poltype-out.
           REWRITE polfilerec
           PERFORM 400-Menu.
       1600-Read3.
           MOVE polAgent-in to agent-in
           READ agent
           INVALID KEY PERFORM 1700-Error3
           NOT INVALID KEY PERFORM 1400-UPDATE2
           END-READ.
       1700-Error3.
           DISPLAY "Error agent was not in file".
           ACCEPT polAgent-in.
           PERFORM 1600-Read3.
       1800-ERROR4.
           DISPLAY "Error choice must be between 1 to 7".
           PERFORM 1400-UPDATE2.
       1100-ADD2.
           MOVE "00000000" to polTerm-in.
           ACCEPT poltype-in.
           IF poltype-in = 111
           ELSE IF poltype-in = 222
           ELSE IF poltype-in = 333
           ELSE
               DISPLAY "Error policy type is not 111, 222, 333"
               ACCEPT poltype-in
           end-if.
           MOVE polNum1-in to polNum1-out.
           MOVE polDate-in to polDate-out.
           MOVE polAmt-in to polAmt-out.
           MOVE polPrem-in to polPrem-out.
           MOVE polAgent-in to polAgent-out.
           MOVE polTerm-in to polTerm-out.
           MOVE poltype-in to poltype-out.
           WRITE PRINTREC from INFOLine AFTER ADVANCING 1 Line.
           WRITE PRINTREC from "        ADD".
           WRITE polfilerec.
           PERFORM 400-Menu.
       300-Exit.
           CLOSE polfile report1 agent.
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
