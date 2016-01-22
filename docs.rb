require "sinatra"

get "/" do
  redirect to("http://administrate-prototype.herokuapp.com/")
end

get "/:path" do
  redirect to("http://administrate-prototype.herokuapp.com/#{params[:path]}")
end
