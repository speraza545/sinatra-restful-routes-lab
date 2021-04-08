class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    @recipes = Recipes.all
    erb :index
  end

  get "recipe/new" do 
    erb :create
  end

  get "/recipes/:id" do 
    @recipe = Recipes.find_by_id(params[:id])
    erb :show
  end

  post "/recipes" do 
    @recipe = Recipe.new(params)
    @recipe.save
  end



end
