module Api
  module V1
    class GuestsController < ApplicationController
      swagger_controller :guests, 'Guest Management'

      swagger_api :create do
        summary 'Create Guest'
        param :form, :"guest[email]", :string, :required, 'Guest email'
        param :form, :"guest[name]", :string, :required, 'Guest Name'
        response :created
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def create
        @guest = Guest.new(create_guest)
        if @guest.save
          render 'api/v1/guests/show', status: :created
        else
          render 'shared/model_errors', local: {object: @guest}, status: :bad_request
        end
      end

      private

      # Private methods

      # mass assignment strong params
      def create_guest
        params.require(:guest).permit(:email, :name)
      end
    end
  end
end