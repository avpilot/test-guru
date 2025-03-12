module GistsHelper
  def url_hash(gist)
    link_to gist.url.match(/[^\/]*$/), gist.url, target: 'blank'
  end
end
