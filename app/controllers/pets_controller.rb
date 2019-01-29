class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    erb :'/pets/new'
  end

  post '/pets' do 
    @owner = Owner.create(params["owner"])
    if !params["owner"]["name"].empty?
      @pets.owners << Owner.create(name: params["owner"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pets = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    if !params[:pet].keys.include?("owner_ids")
      params[:pet]["owner_ids"] = []
      end
      @pets = Pet.find(params[:id])
      @pets.update(params["pet"])
    if !params["pet"]["name"].empty?
        @owner.pets << Pet.create(name: params["owner"]["name"])
      end
    redirect to "pets/#{@pet.id}"
  end

end