require 'pessoa'

describe 'Atributos' do
  before(:all) do
    puts ">>>>>>>>>>>>>> ANTES DE TODOS OS TESTES >>>>>>>>>>>>>"
  end

  after(:context) do
    puts ">>>>>>>>>>>>>> DEPOIS DE TODOS OS TESTES >>>>>>>>>>>>>"
  end

  # before(:each) do
  #   puts ">>>>>>> ANTES de cada TESTE"
  #   @pessoa = Pessoa.new
  # end

  # after(:each) do
  #   @pessoa.nome = "Sem nome!"
  #   puts "#{@pessoa.inspect}"
  #   puts ">>>>>>> DEPOIS de cada TESTE"
  # end

  around(:each) do |teste|
    puts ">>>>>>> ANTES de cada TESTE"
    @pessoa = Pessoa.new

    teste.run # roda o teste

    @pessoa.nome = "Sem nome!"
    puts "#{@pessoa.inspect}"
    puts ">>>>>>> DEPOIS de cada TESTE"
  end

  it 'have_attributes' do
    @pessoa.nome = 'Jackson'
    @pessoa.idade = 20

    expect(@pessoa).to have_attributes(nome: 'Jackson', idade: 20)
    expect(@pessoa).to have_attributes(nome: starting_with('J'), idade: (a_value >= 20))
  end

  it 'have_attributes' do
    @pessoa.nome = 'Jose'
    @pessoa.idade = 25

    expect(@pessoa).to have_attributes(nome: 'Jose', idade: 25)
    expect(@pessoa).to have_attributes(nome: starting_with('J'), idade: (a_value >= 20))
  end
end
