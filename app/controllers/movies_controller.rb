class MoviesController < ApplicationController
	before_action :find_movie, only: [:show, :detail_page]
	def popular
	  @movies = Movie.includes(:ratings).all
	  @movies = @movies.sort_by { |movie| movie.average_rating }
    render json: {data: @movies}
  end

	def show
		if @movie.present?
			render json: {data: @movie}
		else
			render json: { message: "movies not found", status: 404 }, status: :not_found
		end
	end

	def search
		@movie = Movie.find_by(title: params[:title])
		if @movie.present?
			render json: {data: @movie}
		else
			render json: { message: "movies not found", status: 404 }, status: :not_found
		end
	end

	def detail_page
		if @movie.present?
			if @movie.poster_image.attached?
				render json: { data:{ title: @movie.title, description: @movie.description, poster_image: Rails.application.routes.url_helpers.rails_blob_url(@movie.poster_image, only_path: true)}}, status: :ok
			else
				render json: { data:{ title: @movie.title, description: @movie.description}}, status: :ok
			end
		else
			render json: { message: "movies not found", status: 404 }, status: :not_found
		end
	end
 
  private

    def find_movie
      @movie = Movie.find_by(id: params[:id])
    end
end
