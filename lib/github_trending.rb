require 'mechanize'

module GithubTrending

  def self.download_repos
  	repos = ""
  	_file = 'today_trending.sh'
  	agent = Mechanize.new
		page = agent.get('http://github.com/trending')
		page.search('.repo-list-name').each do |repo|
			repos << "git clone https://github.com/" + repo.text.strip.split.join + "\n"
		end
		File.open(_file, 'w') { |f| f.write repos }
		File.chmod(0755, _file)
		exec "sh #{_file}"
  end

  def self.list_repos
  	agent = Mechanize.new
		page = agent.get('http://github.com/trending')
		page.search('.repo-list-name').each do |repo|
			puts repo.text.strip.split.join
		end
  end

  def self.test
  	puts "Hello. This is test"
  end

end
