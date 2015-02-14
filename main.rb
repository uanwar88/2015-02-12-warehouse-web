require 'pry'
require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require_relative 'modules'

require_relative 'database_setup'

require_relative 'location'
require_relative 'item0'
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
    new_item = Item.new({"name" => params["name"], "category" => params["category"],"location" => params["location"],"quantity" => params["quantity"],"cost" => params["cost"],"description" => params["description"]})
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
      @item = Item.fetch_item_by(@item_id,1)
      @item_obj = Item.new(@item[0])
      @category = Category.list_one(@item[0]["category"])
      @location = Location.list_one(@item[0]["location"])
      slim :fetched_item
    # else
    #   slim :fetch_product
    # end
  end
end

post '/edit' do
  @edit_id = params['id'].to_i
  if params['e'].to_i == 1
    slim :editing
  else
    Item.edit(params["name"].downcase,params["category"],params["location"],params["quantity"].to_i,params["cost"].to_f,params["description"],@edit_id)
    @pcl_text = "Item updated successfully!"
    slim :success
  end
end

post '/editcl' do
  @pcl = params['pcl'].to_i

  if params['update'].to_i == 1
    if @pcl == 2
      Category.update(params['name'],params['id'].to_i)
      @pcl_text = "Category updated successfully!"
      slim :success
    else
      Location.update(params['name'],params['id'].to_i)
      @pcl_text = "Location updated successfully!"
      slim :success
    end
  end
end
