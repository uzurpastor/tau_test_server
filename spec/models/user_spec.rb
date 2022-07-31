require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { described_class.new name: "username", 
                                    email: "useremail.valid@mail.net",
                                    password: "strongpass",
                                    password_confirmation: "strongpass" }
  describe "callback" do
    it "saves with name in uppercase" do
          user.name = "USERNAME"
          user.save
          expect(user.name).to eq("username")  
        end
    it "saves with email in uppercase" do
          user.email = "UserEmail.Valid@Mail.Net"
          user.save
          expect(user.email).to eq("useremail.valid@mail.net")
        end
  end

  describe 'validation of' do
    describe 'email' do
      it 'has not valid value' do
            user.email = "useremail"
            expect(user).to_not be_valid
          end
      it 'has repeatable value' do
            duplicate = user.dup
            duplicate.save
            user.save
            error = user.errors.full_messages_for(:email)
            expect(error.to_sentence).to eq("Email has already been taken")
          end
    end

    describe 'name' do
      it 'has not valid value ' do
            user.name = "user name"
            expect(user).to_not be_valid
          end
      it 'has value that out of require range' do
            user.name = "a"*18
            user.save
            error = user.errors.full_messages_for :name
            expect(error.to_sentence).to match /Name is too long/
          end
    end
    
    describe 'password' do
      it 'has too long value' do
            user.name = "a"*33
            user.save
            error = user.errors.full_messages_for :name
            expect(error.to_sentence).to match /Name is too long/
          end
      it 'has not match passwords' do
            user.password_confirmation = "simplepass"
            expect(user).to_not be_valid
          end
      it 'saves valid md5 hash to db' do
            user.save
            expect(user.password_digest.size).to eq(60)
          end
    end
  end
end
