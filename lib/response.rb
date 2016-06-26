class Response

  def initialize(row, survey)
    #Return a hash of the question results
    @row = row
    @survey = survey
  end

  def completed?
    !@row[2].nil?
  end

  def email
    @row[0]
  end

  def employee_id
    @row[1]
  end

  def submitted_at
    @row[2]
  end


end

# row[0] => Email
# row[1] => Employee Id
# row[2] => Submitted At Timestamp (if there is no submitted at timestamp, you can assume the user did not submit a survey)
# row[3..row.count] => Each column from the fourth onwards are responses to survey questions.
  # * Answers to Rating Questions are always an integer between (and including) 1 and 5.
  # * Blank answers represent not answered.
  # * Answers to Single Select Questions can be any string.
