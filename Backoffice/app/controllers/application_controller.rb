class ApplicationController < ActionController::Base
    include Knock::Authenticable

    # undef_method :current_user
  
    # private
  
    # def authenticate_v1_user
    #   authenticate_for V1::User
    # end
end