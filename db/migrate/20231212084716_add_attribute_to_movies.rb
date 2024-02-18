class AddAttributeToMovies < ActiveRecord::Migration[6.1]
  def change
      add_column :movies, :title, :string
      add_column :movies, :genre, :string
      add_column :movies, :director, :string
      add_column :movies, :description, :string
      add_column :movies, :rating, :integer
      add_column :movies, :release_year, :string
      add_column :movies, :duration, :string
      add_column :movies, :cast, :string
  end
end
