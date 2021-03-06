FactoryBot.define do
  factory :customer, aliases: [:user, :father] do #aliases = apelidos

    transient do
      upcased { false }
      qtt_orders { 3 }
    end

    name { Faker::Name.name }
    address { Faker::Address.street_address }

    # email { Faker::Internet.email }
    sequence(:email) { |n| "meu_email-#{n}@email.com" }
    # sequence(:email, 35) { |n| "meu_email-#{n}@email.com" }
    # sequence(:email, 'a') { |n| "meu_email-#{n}@email.com" }

    gender { ['M', 'F'].sample }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_male_default, traits: [:male, :default]
    factory :customer_female_default, traits: [:female, :default]
    factory :customer_with_orders, traits: [:with_orders]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
# after(:build) -> depois de ser criado em memória com build ou create
# before(:create) -> antes de efetivamente salvar
# after(:create) -> depois que é salvo
