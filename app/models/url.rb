require 'csv'

class Url < ApplicationRecord
  validates :original, :link, :visits, presence: true

  def self.to_csv
    attributes = %w[original link visits]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |url|
        csv << attributes.map { |attr| url.send(attr) }
      end
    end
  end

  def self.csv_filename
    "urls-#{Time.zone.today}-#{SecureRandom.hex(4)}.csv"
  end
end
