describe 'HTTParty' do
  it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts' } do
    # it 'content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do #match_request_on -> url nao deterministica
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
    # to_return(status: 200, body: '', headers: { 'content-type': 'application/json; charset=utf-8' })
    # VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2') # /posts/#{[1,2,3,4,5].sample} -> url nao deterministica
      content_type = response.headers['content-type']
      # puts content_type
      expect(content_type).to match(/application\/json/)
    # end
  end

  it 'content-type - record new episodes (vcr)', vcr: { cassette_name: 'jsonplaceholder/albums', record: :new_episodes } do
    # response = HTTParty.get('https://jsonplaceholder.typicode.com/albums/1')
    response = HTTParty.get('https://jsonplaceholder.typicode.com/albums/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end
end