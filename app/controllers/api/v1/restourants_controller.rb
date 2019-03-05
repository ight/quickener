module Api
  module V1
    class RestourantsController < ApplicationController
      swagger_controller :restourants, 'Restourant Management'

      swagger_api :create do
        summary 'Create restourant'
        param :form, :"restourant[email]", :string, :required, 'Restourant email'
        param :form, :"restourant[name]", :string, :required, 'Restourant Name'
        param :form, :"restourant[phone]", :string, :required, 'Restourant phone number'
        response :created
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def create
        @restourant = restourant.new(create_restourant)
        if @restourant.save
          render 'api/v1/restourants/show', status: :created
        else
          render 'shared/model_errors', local: {object: @restourant}, status: :bad_request
        end
      end

      swagger_api :index do
        summary 'get list of restourants'
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def index
        @restourants = Restourant.all
      end

      private

      # Private methods

      # mass assignment strong params
      def create_restourant
        params.require(:restourant).permit(:email, :name, :phone)
      end
    end
  end
end