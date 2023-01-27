# Pathfinder

## Equipe: 
* BRODA Lou
* FERREIRA Pierre
* FRANCO Nicolas
* RICHARD Corentin


## Instalation Flutter 

### Linux (manually)
___
### Windows
_To install flutter on windows simply follow the steps at: https://docs.flutter.dev/get-started/install/windows_

#### Edit your path variable
Once you've installed flutter you'll have to edit your path variabe to be able to run the `flutter` command from anywhere you want.

You can do that through the Powershell using the command `setx /M PATH "$($env:path);c:path\to\flutter\bin"`  

You can also do that through windows settings GUI:  
* First search for `env` on your windows start menu
* Next go to `Environment variables` at the bottom
* In the user variables section chose the `Path` variable and then click in `edit`
* In the edit menu click `add new`, then input the path to your `flutter\bin` directory

You should now be able to run the `flutter`. To test, you can try running the `flutter doctor` command on a terminal. 