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

  post '/pets/new' do 
  @pet = Pet.create(params[:pet]) 
  puts "pet created with id #{@pet.id} and params are #{params[:pet]} and owner id is #{@pet.owner_id}"
  @owner_data = params[:owner]
    if @owner_data && @owner_data[:name] && @owner_data[:name].length >0
      @owner = Owner.create(@owner_data)
      @pet.owner_id = @owner.id
      @pet.owner = @owner
      @pet.save
    end
    redirect "/pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    puts "got to pets edit"
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    
  erb :'pets/edit'

  end
  
  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'pets/show'
  end
  
  patch '/pets/:id' do

    if !params["owner"]["name"].empty?
      @owner = Owner.create(name: params["owner"]["name"])
      params[:pet]["owner_id"] = @owner.id
    end

    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])

    redirect "/pets/#{@pet.id}"
  end

end