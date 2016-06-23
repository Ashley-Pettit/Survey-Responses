class Results

  def total_participants
    #A participant is deemed someone who completed a survey
    results.each do |result|
      if was_survey_submitted?(result)
        survey_participants += 1 ||= 1
      end
    end
  end

  def total_participants
    100
    #work out this logic
  end

  def participation_percentage
    total_invitations / total_participants
  end

  def was_survey_submitted?(result)
    !submitted_at.nil?
  end

  def display_results(results)
    results.each do |result|
      if was_survey_submitted?(result)
        #Then the results should be considered
      end
    end

  end


end
