class Pessoa
  def gritar(texto = "Grrrrrrhhhh!!")
    "Gritando.... #{texto}"
  end

  def agradecer(texto = "Obrigada!")
    puts texto
  end
end

##################

obj1 = Pessoa.new
puts obj1.gritar("AAAAAAAAHHHHHH")
obj1.agradecer("Thanks!!!")
