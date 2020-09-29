class CreateUrlService
  def initialize(form:)
    @form = form
  end

  def call
    return false unless @form.valid?

    # TODO: do not create if exists (find_or_create_by original)
    create_url
  end

  private

  attr_reader :form

  def create_url
    Url.create(attributes)
  end

  def attributes
    form.attributes.merge!(link: shortened_link)
  end

  def shortened_link
    SecureRandom.hex(4)
  end
end
