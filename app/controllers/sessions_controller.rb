class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      reset_session
      session[:user_id] = user.user_id
      redirect_to root_path, notice: 'Seja bem vindo ao sistema'
    else
      redirect_to new_session_path, alert: 'Dados de acesso inválidos'
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path, notice: 'Sessão finalizada com sucesso'
  end

end
