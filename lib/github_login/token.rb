class GithubLogin::Token
  def save
    File.open(file_path, 'w+') { |file| file.write token}
  end

  def load
    @token = file_content unless file_content.to_s.empty?
  end

  def fetch
    load or save
    token
  end

  private

  def token
    @token ||= oauth.token
  end

  def oauth
    github.oauth.create 'scopes' => ['repo']
  rescue Github::Error::Unauthorized
    puts "\nWrong credentials"
    GithubLogin::NullOauth.new
  end

  def github
    Github.new login: login, password: password
  end

  def login
    print "Github username: "
    $stdin.gets.strip
  end

  def password
    print "Github password: "
    `stty -echo`
    $stdin.gets.strip
  ensure
    `stty echo`
    print "\n"
  end

  def file_path
    File.expand_path("~/.github_token")
  end

  def file_content
    File.read(file_path) if File.exists?(file_path)
  end

end