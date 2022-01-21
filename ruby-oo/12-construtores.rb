class Pessoa
  attr_accessor :nome
  attr_accessor :idade

  def initialize(nome, idade)
    @nome = nome
    @idade = idade
  end

end

##################

pessoa1 = Pessoa.new('Jackson Pires', 30)

pessoa2 = Pessoa.new('João', 34)
# por causa dos acessores consigo chamar dessa forma:
puts pessoa1.nome
puts pessoa1.idade

puts pessoa2.nome
puts pessoa2.idade

# puts pessoa1.get_nome
# puts pessoa1.get_idade

# puts pessoa2.get_nome
# puts pessoa2.get_idade
