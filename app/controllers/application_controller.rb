require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  # index all articles
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  # create new
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # posts create
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end

  # show article
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  # edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update article
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #delete
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end
