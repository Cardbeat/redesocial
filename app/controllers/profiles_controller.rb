class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:success] = "Perfil criado com sucesso!"
      redirect_to root_path
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
  end

  def profile_params
    params.require(:profile).permit(:username, :lastname, :subnick)
  end
end
