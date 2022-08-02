module Helper
	module User
		def create_local_user name: "Lexy", email: "lexy@mail.com", password: "password", password_confirmation: "password"
			FactoryBot.create( :user, name: name,
		                            email: email,
		                            password: password,
		                            password_confirmation: password_confirmation )			
		end
		def custom_expect response, status: nil, expected_keys: nil, unexpected_keys: nil
			@response = response

			response_status_like? 					status 						if status.present?
			response_expected_keys_like?		expected_keys 		if expected_keys.present?
			response_unexpected_keys_like? 	unexpected_keys 	if unexpected_keys.present?
		end

		private

		def response_status_like? status 
			expect( @response )
			  .to have_http_status status			
		end
		def response_expected_keys_like? expected_keys 
			expect( JSON.parse(@response.body).keys )
			  .to include match Regexp.new expected_keys.join '|'
		end
		def response_unexpected_keys_like? unexpected_keys 
			expect( JSON.parse(@response.body).keys )
			  .to_not include match Regexp.new unexpected_keys.join '|'
		end
	end
end