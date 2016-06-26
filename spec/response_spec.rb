require_relative 'response.rb'

describe Response do
  let!(:response) { Response.new(['test@test.com', '1234', '12:34pm', '1'])}
  describe 'completed?' do
    context 'The survey is marked as complete if the submitted_at time is not nil' do
      subject { response.valid? }
      it { is_expected.to be_truthy}
    end
  end

  describe 'email' do
    context 'it returns the correct email' do
      subject { response.email }
      it { is_expected.to eq "test@test.com"}
    end
  end
end
