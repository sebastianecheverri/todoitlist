require "rubygems"
require "sinatra"
require "make_todo"
require "httparty"

get '/?' do
  @tareas = Tarea.all
  erb :index
end

post '/create' do
  Tarea.create(params[:titulo])
  redirect '/'
end

post '/complete' do
  Tarea.update(params[:id])
  redirect '/'
end

post '/find' do
  @busqueda = Tarea.find(params[:id])
  erb :busqueda
  # redirect '/'
end

post '/delete' do
  Tarea.destroy(params[:id])
  redirect '/'
end
