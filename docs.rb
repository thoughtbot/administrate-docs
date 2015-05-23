require "sinatra"
require "rdiscount"
require "sass"

get "/favicon.ico" do
end

get "/style.css" do
  scss :style, layout: false
end

get "/" do
  markdown "README".to_sym, :layout_engine => :erb
end

get "/:page" do
  markdown params[:page].to_sym, :layout_engine => :erb
end
