require "csv"

class Application

  def parse(file_location)
    answers_file_location = matching_results(file_location)
    total_participants(answers_file_location)
  end

  def print_participation
    puts "Total invitations to surveys were #{total_participants}"
    puts "Total participants (Those who completed surveys were #{total_participants}"
    puts "The % completion was #{participation_percentage}"
  end

  def valid_file?(file_location)
    #Need better validation of csv here
    file_location.include?('.csv')
  end

  def matching_results(file_location)
    file_location.gsub('.csv', '-responses.csv')
  end

  def was_survey_submitted?(result)
    !submitted_at.nil?
  end

  def total_invitations(answers_file)
    invitation_count = 0
    CSV.foreach(answers_file) do |row|
      invitation_count += 1
    end
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
    total_invitations / total_participants
  end

  # def display_results(results)
  #   results.each do |result|
  #     if was_survey_submitted?(result)
  #       #Then the results should be considered
  #     end
  #   end
  # end



  # def read_results(questions_file_location, answers_file_locaiton)
  #   CSV.foreach(file_data) do |row|
  #     puts row[2].inspect
  #   end
  # end


end
