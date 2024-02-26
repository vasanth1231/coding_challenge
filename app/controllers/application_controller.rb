# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # def json_request?
  #     request.format.json?
  # end
end
