require 'rails_helper'

RSpec.describe MobileOparatorsController, type: :controller do
  
  let!(:user) { create(:user) }
   # set headers for authorization
  let(:headers) { { 'Authorization' => token_generator(user.id) } }

  let(:valid_attributes) do {
    'name': 'GP'
  }
  end

  let(:invalid_attributes) do {
    'name': nil
  }
  end

  before do
    request.headers.merge!(headers)
  end  

  describe "GET #index" do
    it "returns a success response" do
      mobile_oparator = MobileOparator.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      mobile_oparator = MobileOparator.create! valid_attributes
      get :show, params: {id: mobile_oparator.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new MobileOparator" do
        expect {
          post :create, params: {mobile_oparator: valid_attributes}
        }.to change(MobileOparator, :count).by(1)
      end

      it "renders a JSON response with the new mobile_oparator" do

        post :create, params: {mobile_oparator: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(mobile_oparator_url(MobileOparator.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new mobile_oparator" do        
        post :create, params: {mobile_oparator: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do {
       'name': "banglalink"  
      }
      end

      it "updates the requested mobile_oparator" do
        mobile_oparator = MobileOparator.create! valid_attributes
        put :update, params: {id: mobile_oparator.to_param, mobile_oparator: new_attributes}
        mobile_oparator.reload             
      end

      it "renders a JSON response with the mobile_oparator" do
        mobile_oparator = MobileOparator.create! valid_attributes

        put :update, params: {id: mobile_oparator.to_param, mobile_oparator: valid_attributes}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the mobile_oparator" do
        mobile_oparator = MobileOparator.create! valid_attributes

        put :update, params: {id: mobile_oparator.to_param, mobile_oparator: invalid_attributes}
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested mobile_oparator" do
      mobile_oparator = MobileOparator.create! valid_attributes
      expect {
        delete :destroy, params: {id: mobile_oparator.to_param}
      }.to change(MobileOparator, :count).by(-1)
    end
  end

end
