class RedirectService
  def initialize(link:)
    @link = link
  end

  def call
    return false unless url.present?
    return false if link.nil?

    # TODO: add any statistics you want here
    url.increment!(:visits)
  end

  def redirect_url
    URI.parse(original).scheme ? original : "http://#{original}"
  end

  private

  attr_reader :link

  def url
    @url ||= Url.find_by(link: link)
  end

  def original
    @original ||= url.original
  end
end
