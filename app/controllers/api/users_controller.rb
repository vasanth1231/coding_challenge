# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def tasks
      render json: Task.where(user_id: params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
end
