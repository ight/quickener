module Api
  module V1
    class TablesController < ApplicationController
      swagger_controller :tables, 'Table Management'

      swagger_api :create do
        summary 'Create tables for a restourant'
        param :form, :"table[restourant_id]", :number, :required, 'Restourant Id'
        param :form, :"table[name]", :string, :required, 'Table Name'
        param :form, :"table[min_num]", :integer, :required, 'minimum number of people in a table'
        param :form, :"table[max_num]", :integer, :required, 'maximum number of people in a table'
        response :created
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def create
        @table = Table.new(create_table)
        if @table.save
          render 'api/v1/tables/show', status: :created
        else
          render 'shared/model_errors', local: {object: @table}, status: :bad_request
        end
      end

      swagger_api :index do
        summary 'get list of table'
        param :query, :restourant_id, :integer, :required, 'Restourant ID'
        param :query, :page, :integer, :optional, 'page'
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def index
        restourant_id = params[:restourant_id]
        restourant = Restourant.where(id: restourant_id).first
        @tables = restourant.tables
      end

      private

      # Private methods

      # mass assignment strong params
      def create_table
        params.require(:table).permit(:restourant_id, :name, :min_num, :max_num)
      end
    end
  end
end