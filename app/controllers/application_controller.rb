class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    all_baked_goods_sorted_by_price = BakedGood.all.order(price: :desc).to_json
  end

  get '/baked_goods/most_expensive' do
    max_price = BakedGood.maximum(:price)
    most_expensive = BakedGood.where(['price = ?', max_price]).first.to_json
  end

end
