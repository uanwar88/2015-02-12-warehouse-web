require 'pry'
require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'


require_relative 'database_setup'
require_relative 'location'
require_relative 'item'
require_relative 'category'

get '/' do
  slim :home
end

get '/manager' do
  @action = params["action"].to_i
  @pcl = params["pcl"].to_i
  slim :action
end

post '/add_item' do
  if params["add"].to_i == 1
    @pcl_text = "Item added successfully!"
    new_item = Item.new(params["name"],params["category"],params["location"],params["quantity"],params["cost"],params["description"])
    new_item.insert
    slim :success
  else
    slim :error
  end
end

post '/addcl' do
  if params["add"].to_i == 1
    if params["pcl"].to_i == 2
      @pcl_text = "Category added!"
      Category.add(params["name"])
      slim :success
    elsif params["pcl"].to_i == 3
      @pcl_text = "Location added!"
      Location.add(params["name"])
      slim :success
    else
      slim :error
    end
  end
end

post '/delcl' do
  if params["del"].to_i == 1
    if params["pcl"].to_i == 2
      @pcl_text = "Category deleted!"
      Category.delete(params["category"])
      slim :success
    elsif params["pcl"].to_i == 3
      @pcl_text = "Location deleted!"
      Location.delete(params["location"])
      slim :success
    else
      slim :error
    end
  end
end

post '/delete' do
  if params["item"].to_i == 1
    @pcl_text = "Item deleted!"
    Item.delete(params["id"].to_i)
    slim :success
  else
    slim :error
  end
end

post '/fetch' do
  if params["fetch"].to_i == 1
    # if params["id"].to_i != 0
      @item_id = params["id"].to_i
      slim :fetched_item
    # else
    #   slim :fetch_product
    # end
  end
end
