class Movie < ApplicationRecord
	has_one_attached :poster_image
	has_many :ratings, dependent: :destroy

  def average_rating
    ratings.average(:rate).to_i
    self.update(rating: ratings.average(:rate).to_i)
  end

  # def self.to_csv(your_models)
  #   attributes = %w{title description} # Add other attributes as needed

  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes

  #     your_models.each do |your_model|
  #       csv << attributes.map{ |attr| your_model.send(attr) }
  #     end
  #   end
  # end

end
