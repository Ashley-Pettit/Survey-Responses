##ABOUT

This is a programming excercise for CultureAmp.
The problem involves making a program to parse CSV data and display results
In this repo there is a task.md file which describes the task and it's requirements

Wherever possible I've attempted to follow SOLID design principals.


##HOW TO RUN

1. Download this repo by clicking the download as zip button
2. Unzip the file
4. Ensure you have at least v2.2.2 of ruby installed. You can check by running ruby -v in your terminal/console. Ruby can be downloaded at https://www.ruby-lang.org/en/downloads/
5. With ruby installed navigate to the downloaded unzipped file with your terminal
6. Once in the folder type ruby application.rb and the program will run

##DESIGN CONSIDERATIONS

- As a CLI there are various commands the user may type.
- QUIT, HELP and DEMO were added as commands for convenience.

##FOCUS ON SOLID DESIGN

- There an attempt to show single responsibility design
- An example is the use of methods such as "valid_file?" This method is easily isolated and tested
- I/O is isolated to the application.rb file
