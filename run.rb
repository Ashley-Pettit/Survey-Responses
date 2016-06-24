require_relative 'lib/application.rb'

#The run file is here simply to run the file and to handle all I/O
class Run

  def initialize
    @application = Application.new
    @test_file_location = "example-data/survey-1.csv"
    greeting
    loop do
      input
    end
  end

  def input
    puts "Please enter the location of the survey questions file or another relevant command."
    user_input = gets.chomp.downcase
    if @application.valid_file?(user_input)
      @application.parse(user_input)
    elsif user_input == 'test'
      @application.parse(@test_file_location)
    elsif user_input == 'quit'
      quit
    elsif user_input == 'help'
      help
    else
      error_message
    end
  end

  def greeting
    puts "Ready to parse and display survey data."
    puts "Please enter the location of the survey questions csv file preceeded by the word Parse"
    puts "E.g. Parse 'example-data/survey-1.csv'."
    puts "This will find the file, automatically find it's matching responses file, parse it, display the results."
    puts "For more guideance please type 'test', help' or to quit just type 'quit'."
  end


  def help
    puts "Put some helpful help here."
  end

  def error_message
    puts "Sorry that command was not understood or the file is not a valid .csv file."
    puts "Please type 'help' if you need assistance or 'quit' to end the program."
  end

  def quit
    puts "Quitting application..."
    exit
  end

end

run = Run.new
