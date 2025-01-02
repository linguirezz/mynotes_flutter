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


## bug :
 bug still not discover yet in this commit

## what i've done :
- error handler (user not found , wrong password , lack of character, password too weak , user already registered ,email tidak valid, dan error selain dari error autentikasi) DONE
-remove the error handler function into its own file in utilities folder DONE
-make email verif on register page DONE
- the email directly got send after click continue/submit button DONE
- make the verif contain the restart button to log out and restart everythinh DONE
- make the verif page has a button to resend the email DONE