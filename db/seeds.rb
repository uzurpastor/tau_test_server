20.times do
	user = Faker::Internet.user('username', 'email', 'password') 
	User.create!(
		name: 					user[:username],
		email: 					user[:email],
		password: 				user[:password],
		password_confirmation: 	user[:password] 
		)
end