FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}" }
    customer #pode ser assim direto que ele vai buscar na factory o customer
    # association :customer, factory: :customer #ou assim. sobrescrevendo o nome da factory exemplo: factory: :client ao invés de customer
  end
end
