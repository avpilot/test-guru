module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Test-guru', "https://github.com/#{author}/#{repo}", target: 'blank'
  end
end
