require "csv"
ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :genre, :director, :description, :rating, :release_year, :duration, :cast, :poster_image
  

  show do |story|
    attributes_table do
      row :title
      row :genre
      row :director
      row :description
      row :rating
      row :release_year
      row :duration
      row :cast
      row :poster_image do |obj|
        if obj.poster_image.present?
          image_tag (obj.poster_image.blob rescue ""), size: "50x50" if obj.poster_image.attached?
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :genre
      f.input :director
      f.input :description
      f.input :rating
      f.input :release_year
      f.input :poster_image, :as => :file
      f.input :duration
      f.input :cast
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :genre
    column :director
    column :description
    column :rating
    column :release_year
    column :poster_image do |obj|
      image_tag (obj.poster_image.blob rescue ""), size: "50x50" if obj.poster_image.attached?
    end
    column :duration
    column :cast
    column :created_at
    actions
  end


  action_item :upload_csv, only: :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "/admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    file = params["upload_csv"]["file"].tempfile
     xlsx = Roo::Spreadsheet.open(file.path, headers: true)
     sheet = xlsx.sheet(0)
     data = sheet.parse
      data.each_with_index do |row,index|
       next  if index < 0
       title = row[0].to_s.gsub(/<\/?[^>]*>/, '')
       genre = row[2]
       director = row[3]
       @movie = Movie.find_by(director: director)
       @movie.update(genre: genre)
      end
    redirect_to admin_movies_path, notice: "Uploading Successfully"
  end

#   collection_action :import_csv, method: :post do
# # byebug
#     users = Movie.all.order("id ASC")
#     csv = CSV.generate( encoding: 'Windows-1251' ) do |csv|
#     csv << [ "Id", "Title", "Genre", "Director", "Description", "Rating", "Release Year"]
#     users.each do |u|
#       userarry = [ u.id, u.title, u.genre, u.director, u.description, u.rating, u.release_year]
#       csv << userarry + ["", "","","", "", ""]
#     end
#     end
#     send_data csv.encode('Windows-1251'), type: 'text/csv; charset=windows-1251; header=present', disposition: "attachment; filename=user_report.csv"
#   end

#   action_item :add do
#     link_to "Export to CSV", import_csv_admin_movies_path, method: :post
#   end

  batch_action :export_csv, method: :get do |ids|
    users = Movie.where(id: ids)
    csv = CSV.generate( encoding: 'Windows-1251' ) do |csv|
      csv << [ "Id", "Title", "Genre", "Director", "Description", "Rating", "Release Year"]
      users.each do |u|
        userarry = [ u.id, u.title, u.genre, u.director, u.description, u.rating, u.release_year]
        csv << userarry + ["", "","","", "", ""]
      end
    end
    send_data csv.encode('Windows-1251'), type: 'text/csv; charset=windows-1251; header=present', disposition: "attachment; filename=user_report.csv"
  end

end
