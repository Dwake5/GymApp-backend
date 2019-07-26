class ApplicationController < ActionController::API

    # This method is very handy as it allows you to find the current usr by sending
    # 'Authorisation: token' instead of sending and deciphering in different functions
    # The user. current-user can be called in the backend to find the current user.
    def current_user
        id = decode_token['id']
        User.find_by(id: id)
    end

    # 
    def decode_token
        begin
            JWT.decode(token, secret).first
        rescue
            {}
        end
    end

    def token
        request.headers['Authorisation']
    end

    # Issues a token to the user, given a data input combined with the secret from below
    def issue_token(data)
        JWT.encode(data, secret)
    end

    # This sets a secret, horcrux, although this is visible to me, in production
    # A user wouldnt be able to see it, yet it is safer to use ENV
    def secret 
        'horcrux'
        # ENV['SECRET']
    end
end
