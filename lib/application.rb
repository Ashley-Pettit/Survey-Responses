require "csv"

class Application

  def parse(questions_file, answers_file)
    @questions_file = questions_file
    @answers_file = answers_file
    @total_invitations = total_invitations(@questions_file)
    @total_participants = total_participants(@answers_file)
    read_questions
    read_answers
    print_participation
  end

  def print_participation
    puts "Here are your results of your culture survey"
    puts "#{@total_participants} people out of #{@total_invitations} completed the survey. A completition rate of %#{participation_percentage}"
  end

  def read_questions
    # # header => theme,type,text
    @questions_csv = CSV.read(@questions_file, headers:true)
    @themes = []
    @question_types = []
    @questions = []
    @questions_csv.each do |row|
      @themes << row[0]
      @question_types << row[1]
      @questions << row[2]
    end
  end

  def read_answers
    @answers_csv = CSV.read(@answers_file)
    @employee_emails = []
    @employee_ids = []
    @submittion_times = []
    @answers = []
    @answers_csv.each do |row|
      if survey_completed?(row)
        @employee_emails << row[0]
        @employee_ids << row[1]
        @submittion_times << row[2]
      end
    end
  end


  def print_participation
    puts "Here are your results of your culture survey"
    puts "#{@total_participants} people out of #{@total_invitations} completed the survey. A completition rate of #{participation_percentage}%"
    puts "You asked questions around #{@themes.uniq}. Let's see how it went."
    puts "Let's look at the question \"#{@questions[0]}\""
    puts "This was a #{@question_types[0]} style of quesiton."
    puts "For this question the average score out of 5 was X."
  end

  def total_invitations(answers_file)
    invitation_count = 0
    CSV.foreach(answers_file) do |row|
      invitation_count += 1
    end
    return invitation_count
  end

  def total_participants(answers_file)
    participant_count = 0
    CSV.foreach(answers_file) do |row|
      if survey_completed?(row)
        participant_count += 1
      end
    end
    return participant_count
  end

  def survey_completed?(result)
    !result[2].nil?
  end

  def participation_percentage
    (@total_participants.to_f / @total_invitations.to_f) * 100
  end

  # row[0] => Email
  # row[1] => Employee Id
  # row[2] => Submitted At Timestamp (if there is no submitted at timestamp, you can assume the user did not submit a survey)
  # row[3..row.count] => Each column from the fourth onwards are responses to survey questions.
      # * Answers to Rating Questions are always an integer between (and including) 1 and 5.
      # * Blank answers represent not answered.
      # * Answers to Single Select Questions can be any string.


end
