describe 'all', type: 'collection' do #collection: true (ou :collection)
  it { expect([1, 7, 9]).to all (be_odd).and be_an(Integer) }
  it { expect(['ruby', 'rails']).to all be_a(String).and include('r') }
end

# rspec . -t collection
# rspec . -t type:collection
# pode configurar no arquivo .rspec tb --tag type:collection
