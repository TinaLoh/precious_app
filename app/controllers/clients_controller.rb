class ClientsController < ApplicationController
  before_action :find_client, only: [:show, :edit, :update, :destroy]

  def index
    @client = Client.all.order("created_at DESC")
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
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

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :image, :description, :age, :gender, :location, :guardian, particularities_attributes: [:id, :note, :_destroy], requirements_attributes: [:id, :step, :_destroy])
  end


  def find_client
    @client = Client.find(params[:id])
  end


end
