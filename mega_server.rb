require 'sinatra'
require 'json'

not_found do
  status 404
  "This page could not be found"
end

get '/' do
  "Hello World!"
end

get '/pedidos' do
   { :person_name => "#{params[:person_name]}" }.to_json
end

post '/pedidos/guardar' do
  #{}"I got #{params[:person_name]}."
   { :person_name => "#{params[:person_name]}" }.to_json
end
