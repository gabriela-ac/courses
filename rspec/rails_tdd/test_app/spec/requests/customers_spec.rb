require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it 'works! 200 OK' do
      get customers_path
      expect(response).to have_http_status(200)
    end

    # it 'JSON Schema' do
    #   customer = create(:customer)
    #   p customer
    #   get '/customers/1.json'
    #   p response.body
    #   expect(response).to match_response_schema("customer")
    # end

    it 'index - json 200 OK - matchers - teste generico' do
      customer = create(:customer)
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: (be_kind_of Integer), # /\d/
        name: (be_kind_of String),
        email: (be_kind_of String)
      ])
    end

    it 'index - json' do
      customer = create(:customer)
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: customer.id,
        name: customer.name,
        email: customer.email
      ])
    end

    it 'show - json 200 OK - matchers - teste generico' do
      customer = create(:customer)
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: 1,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end

    it 'show - json' do
      customer = create(:customer)
      get "/customers/#{customer.id}.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: customer.id,
        name: customer.name,
        email: customer.email
      )
    end

    # it 'create - JSON' do
    #   member = create(:member)
    #   login_as(member, scope: :member)

    #   customer_params = attributes_for(:customer)
    #   headers = { "ACCEPT" => "application/json"}
    #   post "/customers.json", params: { customer: customer_params }, headers: headers

    #   expect(response.body).to include_json(
    #     id: /\d/,
    #     name: customer_params[:name],
    #     email: customer_params.fetch(:email) #customer_params[:email] -> .fetch retorna um erro caso de erro, nao nil
    #     # address: email: customer_params.fetch(:address).fetch(:street)
    #   )
    # end

    # before { @member = create(:member) }

    # it 'update - JSON' do
    #   # member = create(:member)
    #   # login_as(member, scope: :member)
    #   sign_in @member

    #   customer = Customer.first
    #   customer.name += " - ATUALIZADO"

    #   headers = { "ACCEPT" => "application/json"}
    #   patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers

    #   expect(response.body).to include_json(
    #     id: /\d/,
    #     name: customer_params.name,
    #     email: customer_params.email
    #   )
    # end

    # it 'destroy - JSON' do
    #   member = create(:member)
    #   login_as(member, scope: :member)
    #   # sign_in @member

    #   customer = Customer.first

    #   headers = { "ACCEPT" => "application/json"}
    #   expect { delete "/customers/#{customer.id}.json", headers: headers }.to change(Customer, :count).by(-1)
    #   expect(response).to have_http_status(204)
    # end

    it 'show - json - com Ruby puro' do
      customer = create(:customer)
      get "/customers/#{customer.id}.json"
      response_body = JSON.parse(response.body)
      expect(response_body.fetch("id")).to eq(1)
      expect(response_body.fetch("name")).to be_kind_of(String)
      expect(response_body.fetch("email")).to be_kind_of(String)
    end
  end
end
