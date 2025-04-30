Create a program that allows the user to update, add or delete a record on polfile.dat

On add make sure all fields or not blank, also make sure the record does not exist. display an error message for either exception Edit so the type can only be 111,222,333. For policy date use the current date term date  term date should be 0.

Make sure Agent is valid.

on update make sure policy exist, if not display error message. Allow the user to update only the fields that they wish to update. type can only be 111,222,333

On delete, display a error message if policy does not exist add a confirmation message.

For all three options print the policy number, and ADD, DELETE, or UPDATE on a report. This program must allow the user to perform multiple entries.

When you have completed upload the program and the BIN. Make sure to check the rubric below before you start. I will not accept anything after 12/6.

Policy file layout:

03 polNum1-in pic x(6).

03 polDate-in pic 9(8).

03 polAmt-in pic 9(8).

03 polPrem-in pic 9(4)v99.

03 fill pic xx.

03 polAgent-in pic x(5).

03 polTerm-in pic 9(8).

03 poltype-in pic x(3).