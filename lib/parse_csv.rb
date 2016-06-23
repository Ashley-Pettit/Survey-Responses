require "csv"

class ParseCSV

  def initialize
    file_location_test_only = "example-data/survey-1.csv"
    # read_questions(file_location_test_only)
    read_results(matching_results(file_location_test_only))
  end

  def valid_file?(file_location)
    true
    # Write out the logic here to see if it's a correct csv file
    # test_location.contains('.csv')
  end

  def read_questions(file_data)
    CSV.foreach(file_data) do |row|
      puts row
    end
  end

  def matching_results(file_location)
    file_location.gsub('.csv', '-responses.csv')
  end

  def read_results(file_data)
    CSV.foreach(file_data) do |row|
      puts row
    end
  end

end
