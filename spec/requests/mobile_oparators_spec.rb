require 'rails_helper'

RSpec.describe 'MobileOparators', type: :request do
  let(:user) { create(:user) }  
  let(:headers) { valid_headers }
  let(:mobile_oparators) { create(:mobile_oparator) }
  let(:mobile_oparator_id) { mobile_oparators.id }
  
  describe 'GET /mobile_oparators' do
    before { get '/mobile_oparators', params: {}, headers: headers }    
    
    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /mobile_oparators/:id' do    
    before { get "/mobile_oparators/#{mobile_oparator_id}", params: {}, headers: headers }
    
    context 'when the record exists' do
      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end
    end
    
    context 'when the record does not exist' do
      let(:mobile_oparator_id) { 700 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end
      
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find MobileOparator/)
      end

    end
  end

  describe 'POST /mobile_oparators' do
    
    let(:valid_attributes) do
     # send json payload
     { name: 'Airtel' }.to_json
    end

   let(:invalid_attributes) do
    # send json payload
    { name: nil }.to_json
  end

   context 'when request is valid' do
     before { post '/mobile_oparators', params: valid_attributes, headers: headers }

     it 'creates a todo' do
       expect(json['name']).to eq('Airtel')
     end

     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end

   context 'when the request is invalid' do     
     before { post '/mobile_oparators', params: invalid_attributes, headers: headers }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     xit 'returns a validation failure message' do
       expect(json['message'])
         .to match(/Validation failed: Name can't be blank/)
     end
   end
  end
  
  describe 'PUT /mobile_oparators/:id' do
    let(:valid_attributes) do { name: 'Shopping' }.to_json end

    context 'when the record exists' do
      before { put "/mobile_oparators/#{mobile_oparator_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /mobile_oparators/:id' do
    before { delete "/mobile_oparators/#{mobile_oparator_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
 end

