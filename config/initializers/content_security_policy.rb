Rails.application.config.content_security_policy do |policy|
	policy.default_src :self, :https
end