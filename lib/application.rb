require_relative 'response'
require_relative 'survey'

class Application

  VALID_COMMANDS = ["PARSE", "HELP", "QUIT", "DEMO"]
  SUPPORTED_FILE_TYPES = [".csv"]

  def initialize
    greeting
    loop do
      input
    end
  end

  def input
    puts "Please enter one of the following commands #{VALID_COMMANDS}"
    user_input = gets.chomp.upcase
    if user_input == 'PARSE'
      parse_input
    elsif user_input == 'QUIT'
      quit
    elsif user_input == 'HELP'
      help
    elsif user_input == 'DEMO'
      demo
    else
      error_message
    end
  end

  def parse_input
    puts "Please enter the location of the survey questions file"
    questions_file = gets.chomp.downcase
    puts "Please enter the location of the survey answers file"
    answers_file = gets.chomp.downcase
    if valid_file?(questions_file) && valid_file?(answers_file)
      puts "Okay great both are valid .csv files"
      @survey = Survey.new(questions_file)
      # @response = Response.new(answers_file)
    else
      puts "Sorry one of the files entered is not a supported filetype. We presently support #{SUPPORTED_FILE_TYPES}"
    end

  end

  def demo
    puts "Loading demo survey questions and results"
    questions_file = "../example-data/survey-1.csv"
    answers_file = "../example-data/survey-1-responses.csv"
    # @application.parse(questions_file, answers_file)
    Survey.new(questions_file, answers_file)
  end

  def valid_file?(file)
    #Need better validation of csv here
    file.include?('.csv')
  end

  def help
    puts "Remember valid commands are #{@VALID_COMMANDS}. Presently only .csv is supported."
    puts "Issues may airse when incorrect filestypes are attempted to be loaded."
  end

  def error_message
    puts "Sorry that command was not understood."
    puts "Please type 'HELP' if you need assistance."
  end

  def quit
    puts "Quitting application..."
    exit
  end

  def greeting
    puts "Welcome to CultureAmps amazing reporting system"
  end

end

run = Application.new
