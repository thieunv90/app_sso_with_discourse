require 'single_sign_on'
class DiscourseSsoController < ApplicationController
  skip_before_action :authenticate_user!

  def sso
    if !current_user
      session[:external_site] = true
      authenticate_user!
    else
      session[:external_site] = nil if session[:external_site].present?
      secret = "i_love_ror" # Secret string you set in Discourse
      sso = SingleSignOn.parse(request.query_string, secret)
      sso.email = current_user.email
      sso.name = current_user.username
      sso.username = current_user.username
      sso.external_id = current_user.id
      sso.sso_secret = secret

      redirect_to sso.to_url('http://localhost:3001/session/sso_login')
    end
  end
end