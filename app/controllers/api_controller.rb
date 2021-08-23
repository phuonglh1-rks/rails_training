# frozen_string_literal: true

class ApiController < ActionController::API
  after_action :cors_set_access_control_headers

  protected

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'

    if @total_count
      headers['Access-Control-Expose-Headers'] = 'X-Total-Count'
      headers['X-Total-Count'] = @total_count
    end
  end
end
