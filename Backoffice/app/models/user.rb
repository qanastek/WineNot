class User < ApplicationRecord
    has_secure_password

    # validates_length_of :password, minimum: 6, maximum: 72, allow_nil: false, allow_blank: false

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    # alias_method :authenticate, :valid_password?

    def self.from_token_request request
        # Returns a valid user, `nil` or raise `Knock.not_found_exception_class_name`
        # e.g.
        username = request.params["auth"] && request.params["auth"]["username"]
        return self.find_by username: username
    end
    
    def self.from_token_payload payload
        self.find payload["sub"]
    end
end
