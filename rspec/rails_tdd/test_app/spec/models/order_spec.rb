require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Possui 1 pedido - belongs_to' do
    order = create(:order)
    # puts order.description
    # puts order.customer.inspect
    # puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Sobrescrevendo atributo' do
    customer = create(:customer, name: 'Nome sobrescrito')
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
    expect(order.customer.name).to eq('Nome sobrescrito')
  end

  it 'Possui 3 pedidos - create_list' do
    orders = create_list(:order, 3, description: "Testeeee")
    # puts orders.inspect
    expect(orders.count).to eq(3)
  end

  it 'Possui 2 pedidos - create_pair' do
    orders = create_pair(:order, description: "Testeeee2")
    # puts orders.inspect
    expect(orders.count).to eq(2)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)
    # puts customer.inspect
    # puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end

  it 'has_many - sobrescrevendo o qtt_orders' do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    expect(customer.orders.count).to eq(5)
  end
end
