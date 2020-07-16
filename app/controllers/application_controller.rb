
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #INDEX Action
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  #NEW action
  get '/articles/new' do
    erb :new
  end

  #SHOW action
  get '/articles/:id' do
    @article = Article.all.find(params[:id])
    erb :show
  end 

  #CREATE action
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #EDIT action
  get '/articles/:id/edit' do
    @article = Article.all.find(params[:id])
    erb :edit
  end

  #UPDATE action
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    Article.update({title: params[:title], content: params[:content]})
    redirect to "/articles/#{@article.id}"
  end

  #DELETE ACTION
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy()
    redirect to "/articles"
  end
end
