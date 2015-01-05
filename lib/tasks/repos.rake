namespace :repos do
	desc "Grabs trending repositories every day"
	task grab: :environment do
		agent = Mechanize.new
		page = agent.get('http://github.com')		
	end
end