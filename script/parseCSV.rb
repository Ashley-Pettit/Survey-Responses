class ParseCSV

  def valid_file?(file_location)
    true
    # Write out the logic here to see if it's a correct csv file
    # test_location.contains('.csv')
  end

  def read_questions_csv(file_location)
    # Test location only
    test_location = "example-data/survey-1.csv"
    CSV.foreach(test_location) do |row|
      puts row
    end
  end

  def read_results_csv
  end




end
