class ClientInformationController < ApplicationController
  before_action :authenticate_user!
  before_action :find_client_information, only: [:edit, :update]

  def index
    @users = Users.all
  end

  def new
    @client_information = ClientInformation.new
  end

  def create
    @client_information = ClientInformation.new(client_information_params)
    if @ client_information.save
      flash[:notice] = "Client information was added successfully!"
      redirect_to goals_path
    else
      flash[:error] = "Client information was not added."
      render :new
    end
  end

  def edit
  end

  def update
    if @client_information.update(client_information_params)
      flash[:notice] = "Client information was successfully updated."
      redirect_to goals_path
    else
      flash[:error] = "Client information was not successfully updated."
      render :edit
    end
  end

  private

  def find_client_information
    @client_information = ClientInformation.find_by(id: params[:id])
    unless @client_information
      render(text: "Client Information was not found.", status: :not_found)
    end
  end

  def client_information_params
    params.require(:client_information).permit(:body_mass_index, :body_fat_percentage, :weight, :height, :date_of_birth)
  end

  def authenticate_user
    if @client_information.user_id != current_user.id
      redirect_to root_path
    end
  end
end
