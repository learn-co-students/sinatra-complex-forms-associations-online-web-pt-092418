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
  @pets = Pet.create(params[:pet]) 
  @owner_data = params[:owner]
    if @owner_data && @owner_data[:name]
      @owner = Owner.create(@owner_data)
      @pet_owner_id = @owner.id
      @pet.owner = @owner
      @pet.save
    end
    redirect to "/pets/#{@pets.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    if !params[:pet].keys.include?("owner_id")
      params[:pet]["owner_id"] = []
      end
      @pet = Pet.find(params[:id])
      @pet.update(params["pet"])
    if !params["pet"]["name"].empty?
        @owners.pets << Pet.create(name: params["owner"]["name"])
      end
    redirect to "/pets/#{@pet.id}"
  end

end