# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # Désactive l'authentification CSRF pour l'action magic_link
  skip_before_action :verify_authenticity_token, only: [:create]
  
  # GET /users/sign_in
  def new
    super
  end

  # POST /users/sign_in
  def create
    user = User.find_or_create_by(email: params[:user][:email])
    if user.persisted?
      # Envoyer l'email avec le lien magique
      UserMailer.magic_link(user).deliver_later
      redirect_to root_path, notice: 'Vérifiez vos emails pour vous connecter'
    else
      redirect_to new_user_session_path, alert: 'Une erreur est survenue'
    end
  end

  # GET /magic_link
  def magic_link
    user = User.find_signed(params[:token], purpose: 'magic_link')
    
    if user
      sign_in(user)
      redirect_to root_path, notice: 'Connexion réussie !'
    else
      redirect_to new_user_session_path, alert: 'Ce lien est invalide ou expiré'
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
