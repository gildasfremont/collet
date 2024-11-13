class UserMailer < ApplicationMailer
  def magic_link(user)
    @user = user
    @token = user.signed_id(purpose: 'magic_link', expires_in: 15.minutes)
    @magic_link = magic_link_url(token: @token)
    
    mail(
      to: @user.email,
      subject: 'Votre lien de connexion'
    )
  end
end
