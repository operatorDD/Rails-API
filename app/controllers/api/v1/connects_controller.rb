class Api::V1::ConnectsController < Api::BaseController
  def index
    render json: { connects: 'ok' }
  end
end
