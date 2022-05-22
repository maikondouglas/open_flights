# frozen_string_literal: true

module Api
  module V1
    class AirlinesController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :find_airline_by_slug, only: %i[show update destroy]

      def index
        airlines = Airline.all

        render json: AirlineSerializer.new(airlines, options).serialized_json
      end

      def show
        render json: AirlineSerializer.new(find_airline_by_slug, options).serialized_json
      end

      def create
        airline = Airline.create(airline_params)

        if airline.save
          render json: AirlineSerializer.new(airline).serialized_json
        else
          render json: { errors: airline.errors.messages }, status: 422
        end
      end

      def update
        if find_airline_by_slug.update(airline_params)
          render json: AirlineSerializer.new(airline, options).serialized_json
        else
          render json: { errors: airline.errors.messages }, status: 422
        end
      end

      def destroy
        if find_airline_by_slug.destroy
          head :no_content
        else
          render json: { errors: airline.errors.messages }, status: 422
        end
      end

      private

      def airline_params
        params.require(:airline).permit(:name, :image_url)
      end

      def find_airline_by_slug
        @find_airline_by_slug ||= Airline.find_by(slug: params[:slug])
      end

      def options
        @options ||= { include: %i[reviews] }
      end
    end
  end
end
