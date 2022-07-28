RSpec::Matchers.define :be_a_multiple_of do |expected|

  #teste do matcher
  match do |actual|
    actual % expected == 0
  end

  #messagem de falha
  failure_message do |actual|
    "expect that #{actual} would be a multiple of  #{expected}"
  end

  # messagem de sucesso
  description do
    "#{actual} be a multiple of #{expected}"
  end
end

describe 18, "Custom matcher" do
  it { is_expected.to be_a_multiple_of(3) }
end
