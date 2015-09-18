# controller to display the address page
class AddressesController < ApplicationController
  def province
    @cities = City.where(province_id: params[:id])
    render layout: false
    # render json: @cities.map { |model| { id: model.id, name: model.name } }
  end

  def city
    @states = State.where(city_id: params[:id])
    render layout: false
  end
end
