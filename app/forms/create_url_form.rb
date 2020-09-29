class CreateUrlForm
  include ActiveModel::Model

  attr_accessor :original

  # TODO: add more sophisticated validation of url.original
  validates :original, presence: true

  def attributes
    {
      original: original,
      visits: 0
    }
  end
end
