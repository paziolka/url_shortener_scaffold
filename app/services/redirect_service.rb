class RedirectService
  def initialize(link:)
    @link = link
  end

  def call
    return false unless url.present?

    url.increment!(:visits)
  end

  def redirect_url
    URI.parse(original).scheme ? original : "http://#{original}"
  end

  private

  attr_reader :link

  def url
    @url ||= Url.find(link)
  end

  def original
    original ||= @url.original
  end
end
