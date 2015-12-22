require "sinatra"
require "rdiscount"
require "sass"

get "/:path" do
  redirect to("http://administrate-prototype.herokuapp.com/#{params[:path]}")
end
