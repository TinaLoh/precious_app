class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :edit, :update, :destroy]


  def index

    if params[:search]
      @clients = Client.search(params[:search]).order("created_at DESC")
    else
      @clients = Client.all.order("created_at DESC")
    end
  end

  def show
    gon.latitude = @client.latitude
    gon.longitude = @client.longitude
  end

  def new
    @client = current_user.clients.build
  end

  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      redirect_to @client, notice: "Successfully created new client!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to root_path, notice: "Client was successfully deleted!"
  end

  def map
    client_data = []
    @clients = Client.all

    @clients.each do |client|
      client_data.push(client.image.url)
    end

    gon.clients = @clients
    gon.images = client_data
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :image, :description, :age, :gender, :location, :guardian, particularities_attributes: [:id, :note, :_destroy], requirements_attributes: [:id, :step, :_destroy])
  end


  def find_client
    @client = Client.find(params[:id])
  end


end
