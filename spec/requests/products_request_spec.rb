require 'rails_helper'

RSpec.describe 'Products', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'GET /products' do # rubocop:disable Metrics/BlockLength
    subject(:request) { get products_path, params: params }

    let(:params) { {} }
    let(:body) { JSON.parse(response.body) }
    let(:products) do
      20.times do |n|
        currency = n.even? ? 'ARS' : 'USD'
        Product.create(name: "product #{n}", currency: currency)
      end
    end

    before do
      products
      request
    end

    it 'returns all products' do
      expect(body['products'].size).to eq(20)
      expect(body['metadata']['total_records']).to eq(20)
    end

    context 'with size of products by page' do
      let(:params) { { page: 1, size: 10 } }

      it 'returns the right amount of products' do
        expect(body['products'].size).to eq(10)
        expect(body['metadata']['total_records'].to_i).to eq(10)
      end
    end

    context 'filtered by name' do
      let(:params) { { query: 'product 5' } }

      it 'returns the right product' do
        expect(body['products'].size).to eq(1)
        expect(body['products'].first['name']).to eq('product 5')
      end
    end

    context 'filtered by currency' do
      let(:params) { { currency: 'USD'} }

      it 'returns products with the specified currency' do
        expect(body['products'].size).to eq(10)
        expect(body['products'].pluck('currency')).to all eq('USD')
      end
    end
  end
end
