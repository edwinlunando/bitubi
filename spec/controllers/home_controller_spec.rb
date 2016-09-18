require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Author. As you add validations to Author, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: 'Bejo Sibejo'
    }
  }

  let(:invalid_attributes) {
    {
      name: ''
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AuthorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do

    before do

      create(:category)

    end

    it 'render the home pages' do

      get :index, {}, valid_session
      expect(assigns(:categories)).to eq(Category.all)
      expect(response).to render_template('index')
      should render_template('layouts/application')

    end

  end

end
