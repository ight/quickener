class ApplicationController < ActionController::Base

  include Swagger::Docs::ImpotentMethods

  # Prevent CSRF attacks by raising an exception
  # For API set it to null session
  protect_from_forgery with: :null_session
end
