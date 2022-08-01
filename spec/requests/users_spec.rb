require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:headers) { { 'HTTPS': 'on', 
                    'HTTP_ACCEPT': 'application/json' } }
  before do
    FactoryBot.create(:user, name: "John",
                             email: "john@mail.com",
                             password: "password",
                             password_confirmation: "password" )
   
    FactoryBot.create(:user, name: "Jake",
                             email: "jake@mail.com",
                             password: "password",
                             password_confirmation: "password" )
  end
  describe "GET /users" do
    it 'returns all users' do
        get '/users', headers: headers 

        expect( response )
          .to have_http_status(:success)
        expect( JSON.parse(response.body).size )
          .to eq(2) 
          end
  end
  describe "POST /users" do
    it 'creates a valid user' do
        data = { user: { name: "Lexy",
                         email: "lexy@mail.com",
                         password: "password",
                         password_confirmation: "password" } }
        post '/users', params: data, headers: headers

        expect( response )
          .to have_http_status(:created)
        expect( JSON.parse(response.body).keys )
          .to include "name", "email"
        expect( JSON.parse(response.body).keys )
          .to_not include "password_digest", "is_author"
        expect( User.count )
          .to eq(3) 
          end
    it 'doesn\'t create a nonvalid user' do
        data = { user: { name: "Lexy",
                         email: "lexymail.com",
                         password: "password" } }
        post '/users', params: data, headers: headers

        expect( response )
          .to have_http_status(:unprocessable_entity)
        expect( JSON.parse(response.body).keys )
          .to include "password_confirmation", "email"
        expect( User.count )
          .to eq(2) 
          end
  end
  describe "GET /users/:id" do
    it 'showes a user' do
        user = FactoryBot.create(:user, name: "Lexy",
                                        email: "lexy@mail.com",
                                        password: "password",
                                        password_confirmation: "password" )
        get "/users/#{user.id}", headers: headers

        expect( response )
          .to have_http_status(:success)
        expect( JSON.parse(response.body).keys )
          .to include "name", "email"
        expect( JSON.parse(response.body).keys )
          .to_not include "password_digest", "is_author"
          end
  end
  describe "DELETE /users/:id" do
    it 'deletes a user' do
        user = FactoryBot.create(:user, name: "Lexy",
                                        email: "lexy@mail.com",
                                        password: "password",
                                        password_confirmation: "password" )
        delete "/users/#{user.id}", headers: headers

        expect( response )
          .to have_http_status(:no_content)
          end
  end
end
