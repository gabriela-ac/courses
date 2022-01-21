RSpec::Matchers.define :be_a_multiple_of do |expected|

  # expected == 3
  # actual == subject == 18
  match do |actual|
    actual % expected == 0
  end

  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{expected}, but it is not! <<<<"
  end

  description do
    "be a multiple of #{expected}, and it is! <<<"
  end
end

describe 18, 'Custom Matcher' do
  it { is_expected.to be_a_multiple_of(3) }
end
