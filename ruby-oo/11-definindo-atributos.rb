class Pessoa
  #utilizando accessors:
  # attr_reader + attr_writer = attr_accessor
  attr_accessor :nome 
  attr_accessor :idade
  # @nome = nil
  # @idade = nil

  #set e get = convenção java

  # ruby:
#   def nome=(nome)
#     @nome = nome
#   end

#   def nome
#     @nome
#   end

#   def idade=(idade)
#     @idade = idade
#   end

#   def idade
#     @idade
#   end
end

##################

pessoa1 = Pessoa.new
# pessoa1.set_nome('Jackson')
# pessoa1.set_idade(100)

pessoa1.nome = 'Jackson'
pessoa1.idade = 100

pessoa2 = Pessoa.new
pessoa2.nome = 'Matusalém'
pessoa2.idade = 1000

puts pessoa1.nome
puts pessoa1.idade

puts pessoa2.nome
puts pessoa2.idade

# puts pessoa1.get_nome
# puts pessoa1.get_idade

# puts pessoa2.get_nome
# puts pessoa2.get_idade
