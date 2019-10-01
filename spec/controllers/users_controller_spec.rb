require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "show action" do
    it "renders show template if an user is found" do
      user = create(:user)
      get :show, params: { use_route: '', id: user.id}
      expect(response).to render_template('show')
      # response.should render_template('show')
    end
  end
end
