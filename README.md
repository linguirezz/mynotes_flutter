# mynotes

my first flutter project

## Getting Started
- make sure you have android or ios device
- start by plug your usb cabel into the laptop
- type 'flutter run' on your terminal to start the aplication

## feature 
- routes page
- autentifikasion(login,logout,)
- pop up bar
-  error handler in authentication
- email directly got send after user move into verify route

## todo :
- make auth service
- seperate business logic from client
- buat folder exceptions_auth oada folder service
- buat exception for :
REGISTER:
1. weak-password
2. email-already-in-use
3. invalid-email
4. operation-not-allowed
LOGIN :
1. user-not-found
2. wrong-credential
3. wrong-password
4. user-disable
GENERIC :
1. userNotLoggedIn
2. GenericAuthException

## bug :
 bug still not discover yet in this commit

## what i've done :
- error handler (user not found , wrong password , lack of character, password too weak , user already registered ,email tidak valid, dan error selain dari error autentikasi) DONE
-remove the error handler function into its own file in utilities folder DONE
-make email verif on register page DONE
- the email directly got send after click continue/submit button DONE
- make the verif contain the restart button to log out and restart everythinh DONE
- make the verif page has a button to resend the email DONE