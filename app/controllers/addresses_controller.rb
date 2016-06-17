# controller to display the address page
class AddressesController < ApplicationController

  def province
    response.headers['Cache-Control'] = 'no-transform'
    @cities = City.where(province_id: params[:id])
    render layout: false
  end

  def city
    response.headers['Cache-Control'] = 'no-transform'
    @states = State.where(city_id: params[:id])
    render layout: false
  end

end
