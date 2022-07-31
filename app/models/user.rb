class User < ApplicationRecord
  #====== Callback =====#
  before_validation :value_in_downcase, on: :create

  #====== Validations =====#
  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  
  # Get regex from https://api.rubyonrails.org/classes/ActiveModel/Validations/HelperMethods.html#method-i-validates_format_of
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_format_of :name, with: /\A\w+\z/, on: :create

  validates_length_of :name, in: 2..16
  validates_length_of :password, in: 6..32

  has_secure_password

  private

  def value_in_downcase
    self.email.downcase!
    self.name.downcase!    
  end
end
