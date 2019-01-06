module Api
  module V1
    class ReservationsController < ApplicationController
      swagger_controller :reservations, 'Reservations Management'

      swagger_api :create do
        summary 'Creates a reservation'
        param :form, :"reservation[guest_id]", :integer, :required, 'guest id'
        param :form, :"reservation[table_id]", :integer, :required, 'table id to be reserved'
        param :form, :"reservation[shift_id]", :integer, :required, 'shift id'
        param :form, :"reservation[restourant_id]", :integer, :required, 'restourant id to be booked'
        param :form, :"reservation[reservation_time]", :integer, :required, 'epoch datetime'
        param :form, :"reservation[guest_count]", :integer, :required, 'number of guest'
        response :created
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def create
        @reservation = Reservation.new(reservation_params)
        @reservation.reservation_time = DateTime.strptime(params[:reservation][:reservation_time],'%s')
        if @reservation.save
          render 'api/v1/reservations/show', status: :created
        else
          render 'shared/model_errors', locals: { object: @reservation }, status: :bad_request
        end
      end

      swagger_api :update do
        summary 'Update a reservation'
        param :path, :id, :integer, :required, 'Reservation Id'
        param :form, :"reservation[table_id]", :integer, :required, 'table id to be reserved'
        param :form, :"reservation[shift_id]", :integer, :required, 'shift id'
        param :form, :"reservation[reservation_time]", :integer, :required, 'epoch datetime'
        param :form, :"reservation[guest_count]", :integer, :required, 'number of guest'
        response :created
        response :bad_request
        response :forbidden
        response :not_acceptable
        response :unauthorized
      end

      def update
        @reservation = Reservation.find(params[:id])
        @reservation.reservation_time = DateTime.strptime(params[:reservation][:reservation_time],'%s')
        if @reservation.update_attributes(update_params)
          render 'api/v1/reservations/show', status: :created
        else
          render 'shared/model_errors', locals: { object: @reservation }, status: :bad_request
        end
      end

      swagger_api :index do
        summary 'Fetches all the reservations for a restourant'
        param :query, :restourant_id, :integer, :optional, 'Restourant ID'
        param :query, :page, :integer, :optional, 'page'
        response :ok
        response :forbidden
        response :unprocessable_entity
        response :unauthorized
      end

      def index
        @restourant = Restourant.find(params[:restourant_id])
        reservations = @restourant.reservations.order(id: :desc)
        @reservations = reservations.page(params[:page]).per(Reservation::RECENT_RECORDS_LIMIT)
      end

      private

      def reservation_params
        params.require(:reservation).permit(:guest_id,
          :table_id, :shift_id, :restourant_id, :guest_count)
      end

      def update_params
        params.require(:reservation).permit(:table_id, :shift_id, :guest_count)
      end
    end
  end
end
