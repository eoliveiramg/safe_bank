module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from KeyError do |e|
      render json: { message: e.message }, status: :not_found
    end
  end
end
