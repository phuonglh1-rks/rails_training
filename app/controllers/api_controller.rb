# frozen_string_literal: true

class ApiController < ActionController::API
  after_action :cors_set_access_control_headers

  protected

  def apply_pagination_and_sort(table, data)
    if params['_sort']
      data =
        data
        .order("#{table}.#{params['_sort']} #{params['_order']}")
    end

    if params['_start']
      data =
        data
        .limit(params['_end'])
        .offset(params['start'])
    end

    data
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'

    if @total_count
      headers['Access-Control-Expose-Headers'] = 'X-Total-Count'
      headers['X-Total-Count'] = @total_count
    end
  end
end
