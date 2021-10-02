class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def show
        user = current_user
        render json: user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          # @user.save
          token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

end
