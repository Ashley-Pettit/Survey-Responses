require_relative 'lib/parse_csv'
require_relative 'lib/results'

#The run file is here simply to run the file and to handle all I/O

class Run

  def initialize
    parse = ParseCSV.new
    # @results = Results.new(@parseCSV)
    # greeting
    # loop do
    #   input
    # end
  end

  def greeting
    puts "Ready to parse and display survey data."
    puts "Please enter the location of the survey questions csv file preceeded by the word Parse"
    puts "E.g. Parse 'example-data/survey-1.csv'."
    puts "This will find the file, automatically find it's matching responses file, parse it, display the results."
    puts "For more guideance please type 'help' or to quit just type 'quit'."
  end

  def input
    puts "Please enter the location of the survey file..."
    user_input = gets.chomp
    if valid_file?(user_input)
      find_matching_results
    elsif user_input == 'quit'
      quit
    elsif user_input == 'help'
      help
    else
      error_message
    end
  end

  def help

  end

  def error_message
    puts "Sorry that command was not understood or the file is not a valid .csv file."
    puts "Please type 'help' if you need assistance or 'quit' to end the program."
  end

  def quit
    exit
  end

end

run = Run.new
