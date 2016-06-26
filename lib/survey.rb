require 'csv'
require_relative 'question'

class Survey

  def initialize(survey_file, responses_file)
    @survey_file = survey_file
    @responses_file = responses_file
    @responses = []
    parse_data
    read_responses
    print_data
  end

  def parse_data
    @questions_csv = CSV.read(@survey_file, headers:true)
    @themes = []
    @question_types = []
    @questions = []
    @questions_csv.each do |row|
      @themes << row[0]
      @question_types << row[1]
      @questions << row[2]
    end
  end

  def submitted?(result)
    !result[2].nil?
  end

  def read_responses
    @responses_csv = CSV.read(@responses_file)
    @responses_csv.each do |row|
      @responses << Response.new(row, self)
    end
  end

  def total_invitations
    @responses.count
  end

  def total_participants
    @responses.select { |response| response.completed? }.count
  end

  def participation_percentage
    (total_participants.to_f / total_invitations.to_f) * 100
  end

  def print_data
    puts "Here are your results of your culture survey"
    puts "#{total_participants} people out of #{total_invitations} completed the survey. A completition rate of #{participation_percentage}%"
    puts "You asked questions around #{@themes.uniq.join(", ")}. Let's see how it went."
    puts "You asked #{@questions.join(", ")}"
  end

  def question_with_answer_method
    @questions.each.with_index do |question, index|
      all_answers = []
      @responses.each do |response|
        all_answers << response.answer_at_index(index)
      end
    end
  end

end
