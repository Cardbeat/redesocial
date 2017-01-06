class ProfilesController < ApplicationController
  def index
    @users = User.order(:username)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = User.find(params[:id], current_user)
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Perfil criado com sucesso!"
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:success] = 'Perfil atualizado com sucesso !'
    else
      flash[:error] = 'Erro na atualização do perfil !'
      render 'edit'
    end
  end

  def show
    @user = User.find(current_user)
    @post = @user.posts.build
    @posts = @user.posts.all
    if Profile.exists?(id: current_user)
      @profile = Profile.find(params[:id])
    else
      @profile= Profile.create(id: current_user)
    end

  end

  private

  def profile_params
    params.require(:profile).permit(:username, :avatar, :lastname, :subnick, :user_id)
  end
end
