class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @pets= Pet.all
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    @owners = Owner.create(params["owner"])
   @pets = Pet.create(params[:pet]) 
   if !params["owner"]["name"].empty?
      @pet.owners << Owner.create(name: params["owner"]["name"])
    end
    redirect to "/pets/#{@pets.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    if !params[:pet].keys.include?("owner_ids")
      params[:pet]["owner_ids"] = []
      end
      @pet = Pet.find(params[:id])
      @pet.update(params["pet"])
    if !params["pet"]["name"].empty?
        @owners.pets << Pet.create(name: params["owner"]["name"])
      end
    redirect to "/pets/#{@pet.id}"
  end

end