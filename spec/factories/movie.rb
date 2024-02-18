FactoryBot.define do
  factory :movie, class: "Movie" do
    title {'Animal'}
    genre {'Action, Drama'} 
    director {'Sandeep Reddy Vanga'} 
    description {'A son undergoes a remarkable transformation as the bond with his father begins to fracture, and he becomes consumed by a quest for vengeance.'} 
    release_year {'1 December 2023 (India)'} 
    duration {'3.4'} 
    cast {'Ranbir Kapoor'}
  end
end


# FactoryBot define do 
#    factory :movie, class: "Movie" do
#      title {'movie'}
#      genre {'title '}
#      director{'whatever'}
#      description {'animal movie'}
#      rating{'4.1'}
#      release_year{'2 december 2023'}
#      duration{'1 year'}
#   end 
# end 
