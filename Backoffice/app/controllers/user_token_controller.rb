class UserTokenController < Knock::AuthTokenController
    skip_forgery_protection
end
