require 'sinatra'
require 'json'

before do
    @pedidos = []
end

not_found do
  status 404
  "This page could not be found"
end

get '/' do
  send_file 'index.html'
end

get '/pedidos' do
   received_params = { :person_name => "#{params[:person_name]}" }.to_json
   puts received_params
   return received_params
end

post '/pedidos/guardar' do
  #{}"I got #{params[:person_name]}."
  #@pedidos << params[:person_name]
  #puts "Person name #{params[:person_name]}"
  #puts "USing JSON: #{JSON.parse params[:person_name]}"

  request.body.rewind
  request_payload = JSON.parse request.body.read
  puts "The payload is: #{request_payload}"
  puts "First name: #{request_payload["person_name"]}"
  puts "Amount: #{request_payload["amount"]}"
  puts "Discount: #{request_payload["discount"]}"

  received_params = { :person_name => "#{request_payload["person_name"]}", 
  						:amount => "#{request_payload["amount"]}",
  						:discount => "#{request_payload["discount"]}" }.to_json
  return received_params
end
