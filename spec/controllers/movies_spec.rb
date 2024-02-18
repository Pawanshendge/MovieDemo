require 'rails_helper'

RSpec.describe "MoviesController", type: :request do
  before(:each) do |example|
    @movie = FactoryBot.create(:movie)
  end
  
  context 'bulk_download_zip' do
    it "movie_popular" do
      get "/api/popular"
      data = JSON.parse(response.body)
      expect(response.status).to eq 200
    end

    it "movie_popular" do
      get "/api/movies/#{@movie.id}"
      data = JSON.parse(response.body)
      expect(response.status).to eq 200
    end

    it "movie_popular" do
      @movie.destroy
      get "/api/movies/#{@movie.id}"
      data = JSON.parse(response.body)
      expect(response.status).to eq 404
    end

    it "movie_popular" do
      get "/api/#{@movie.id}/detail_page"
      data = JSON.parse(response.body)
      expect(response.status).to eq 200
    end

    it "movie_details are not present" do
      get "/api/#{-10}/detail_page"
      data = JSON.parse(response.body)
      expect(response.status).to eq 404
    end
  end
end


