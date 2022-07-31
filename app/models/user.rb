class User < ApplicationRecord
  # before_save 
  
  #====== Validations =====#
  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  # Get regex from https://api.rubyonrails.org/classes/ActiveModel/Validations/HelperMethods.html#method-i-validates_format_of
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  validates_length_of :name, in: 2..40
  validates_length_of :password, in: 6..32

  has_secure_password

end
