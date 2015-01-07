namespace :repos do
	desc "Grabs trending repositories every day"
	task grab: :environment do
		agent = Mechanize.new
		page = agent.get('http://github.com/trending')
		page.search('.repo-list-name').each do |repo|
			repo = repo.text.strip.split
			Repository.create(author: repo[0], name: repo[2], trending_on: Date.today)
		end
	end
end