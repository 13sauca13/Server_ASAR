###This script will delete all specific users that are contained on the users txt file from the computers listed in the computers txt file

Requirements:

A txt file with the name of the computers where we want to remove the users
A txt file with the name (SamAccountName) of the users to be deleted from the local administrators group

Just replace the name of the txt file inside the $Computernames variable with the txt file that contains the computer names
Also replace the name of the txt file inside the $Admins variable with the txt file that contains the names (SamAccountName) of the user to be removed 
Please be sure to run this script with an account with sufficient privileges

From [Remove multiple users from the local administrator group on multiple computers](https://gallery.technet.microsoft.com/scriptcenter/Remove-multiple-users-from-86db0d83) on Microsoft´s Technet
