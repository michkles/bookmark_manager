require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

ENV["RACK_ENV"] ||= "development"

  before do
  @links = Link.all
  end

  get '/links' do
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/links/tag' do

    erb :'links/tag'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end


#run! if app_file == $0
end
