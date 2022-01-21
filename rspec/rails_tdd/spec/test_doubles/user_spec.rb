describe 'Test Double' do
  it '--' do
    # criando um objeto falso da classe falsa User
    user = double('User') # colocando uma classe fake no dublê
    # puts user.inspect
    #allow(user).to receive_messages(name: 'Jack', password: 'secret')
    allow(user).to receive(:name).and_return('Jack')
    allow(user).to receive(:password).and_return('secret')
    puts user.name
    puts user.password
  end

  it 'as_null_object' do
    user = double('User').as_null_object
    allow(user).to receive(:name).and_return('Jack')
    allow(user).to receive(:password).and_return('secret')
    puts user.name
    puts user.password
    user.abc
  end
end
