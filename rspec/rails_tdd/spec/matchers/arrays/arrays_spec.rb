RSpec::Matchers.define_negated_matcher :exclude, :include ## negativando matcher

describe Array.new([1, 2, 3]), "Array", type: 'collection' do #collection: true
  it '#include' do
    expect(subject).to include(2)
    expect(subject).to include(1, 2)
  end
  # rspec . -t collection
  # rspec . -t type:collection
  # pode configurar no arquivo .rspec tb --tag type:collection

  it { expect(subject).to exclude(4) }

  it '#contain_exactly' do # slow: true (ou :slow)
    expect(subject).to contain_exactly(1, 2, 3)
    expect(subject).to contain_exactly(2, 1, 3)
  end
  # pode configurar no arquivo .rspec --tag ~slow pra poder excluir o teste

  it '#match_array' do
    expect(subject).to match_array([1, 2, 3])
  end
end
