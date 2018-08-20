class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  acts_as_token_authentication_handler_for User, fallback: :none
end
