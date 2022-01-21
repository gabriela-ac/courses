require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#full_name' do
    customer = create(:customer) # ou create(:user)
    customer2 = create(:customer)
    # puts customer.email
    # puts customer2.email
    expect(customer.full_name).to start_with('Sr. ')
  end

  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:customer, name: 'Gabriela Castro')
    expect(customer.full_name).to eq('Sr. Gabriela Castro')
  end

  it '#full_name - Sobrescrevendo atributo' do
    customer = create(:customer,vip: false, days_to_pay: 10)
    expect(customer.vip).to be false
  end

  it 'Herança factories' do
    customer = create(:customer_vip)
    expect(customer.vip).to be true
  end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    # attrs_vip = attributes_for(:customer_vip)
    # attrs_default = attributes_for(:customer_default)
    # puts attrs
    # puts attrs_vip
    # puts attrs_default
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    # puts attributes_for(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Masculino Default' do
    customer = create(:customer_male_default)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(false)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino Vip' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'Customer with orders' do
    customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(3)
  end

  it 'travel_to' do
    travel_to(Time.zone.local(2004, 11, 24, 01, 04, 44)) do
      @customer = create(:customer_vip)
    end

    # puts @customer.created_at
    # puts Time.now
    expect(@customer.created_at).to eq(Time.zone.local(2004, 11, 24, 01, 04, 44))
    expect(@customer.created_at).to be < Time.now
    #gem Timecop faz algo parecido e pode ser usado pra ruby tb, enquanto o time helper é apenas rails
  end

  it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }
end
