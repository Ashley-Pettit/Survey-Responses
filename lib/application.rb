require "csv"

class Application

  def parse(questions_file, answers_file)
    @questions_file = questions_file
    @answers_file = answers_file
    @total_invitations = total_invitations(@questions_file)
    @total_participants = total_participants(@answers_file)
    print_participation
  end

  def was_survey_submitted?(result)
    !submitted_at.nil?
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
      #If the submitted date is nil the person is not added to total_participants
      if !row[2].nil?
        participant_count += 1
      end
    end
    return participant_count
  end

  def participation_percentage
    (@total_participants.to_f / @total_invitations.to_f) * 100
  end

  def print_participation
    puts "Here are your results of your culture survey"
    puts "#{@total_participants} people out of #{@total_invitations} completed the survey. A completition rate of %#{participation_percentage}"
    read
  end

  def read
    CSV.foreach(@questions_file) do |row|
      puts "Question 1 - #{row[1]}"
    end
  end

    # * Email
    # * Employee Id
    # * Submitted At Timestamp (if there is no submitted at timestamp, you can assume the user did not submit a survey)
    # * Each column from the fourth onwards are responses to survey questions.
    # * Answers to Rating Questions are always an integer between (and including) 1 and 5.
    # * Blank answers represent not answered.
    # * Answers to Single Select Questions can be any string.

    # CSV.foreach(@questions_file) do |row|
    #   puts row
    # end


  end

end
