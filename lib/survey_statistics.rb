class SurveyStatistics

  def print_participation
    puts "Here are your results of your culture survey"
    puts "#{@total_participants} people out of #{@total_invitations} completed the survey. A completition rate of %#{participation_percentage}"
  end

  def was_survey_submitted?(result)
    !row[2].nil?
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
      if was_survey_submitted?(answers_file)
        participant_count += 1
      end
    end
    return participant_count
  end

  def participation_percentage
    (@total_participants.to_f / @total_invitations.to_f) * 100
  end

end
