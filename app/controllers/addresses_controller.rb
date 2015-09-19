# controller to display the address page
class AddressesController < ApplicationController
  def province
    @cities = City.where(province_id: params[:id])
    render layout: false
  end

  def city
    @states = State.where(city_id: params[:id])
    render layout: false
  end
end
