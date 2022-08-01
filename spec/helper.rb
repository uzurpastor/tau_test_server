module Helper
	module User
		def create_local_user name: "Lexy", email: "lexy@mail.com", password: "password", password_confirmation: "password"
			FactoryBot.create( :user, name: name,
		                            email: email,
		                            password: password,
		                            password_confirmation: password_confirmation )			
		end
	end
end