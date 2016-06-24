class ParseCSV


  def questions
    puts "Here are your results of your culture survey"
    puts "4 people out of 5 completed the survey. A completition rate of %80"
    puts "Around the theme of 'The Work' you asked..."
    puts "I like the kind of work I do."
    puts "Responses averaged a score of 4.3"
    puts "In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective."
    puts "Responses for this question averaged a score of 4.3"
  end

  # theme,type,text
  # The Work,ratingquestion,I like the kind of work I do.
  # The Work,ratingquestion,"In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective."
  # The Work,ratingquestion,We are working at the right pace to meet our goals.
  # The Place,ratingquestion,I feel empowered to get the work done for which I am responsible.
  # The Place,ratingquestion,I am appropriately involved in decisions that affect my work.
  #
  # ### Survey Data
  # Included in the folder example-data are three sample data files defining surveys:
  # * survey-1.csv
  # * survey-2.csv
  # * survey-3.csv
  #
  # Each row represents a question in that survey with headers defining what question data is in each column.
  #
  # ### Response Data
  # And three sample files containing responses to the corresponding survey:
  # * survey-1-responses.csv
  # * survey-2-responses.csv
  # * survey-3-responses.csv
  #
  # Response columns are always in the following order:
  # * Email
  # * Employee Id
  # * Submitted At Timestamp (if there is no submitted at timestamp, you can assume the user did not submit a survey)
  # * Each column from the fourth onwards are responses to survey questions.
  # * Answers to Rating Questions are always an integer between (and including) 1 and 5.
  # * Blank answers represent not answered.
  # * Answers to Single Select Questions can be any string.
  #

end
