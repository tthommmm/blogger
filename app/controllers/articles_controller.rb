class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret",
	execpt: [:index, :show]

	def index 
		@articles = Article.all
		#render plain: params[:article].inspect
		#'plain' => 'params[:article]'
		#this action gets information from POST 
	
	end

	def new
		@article = Article.new
		#hi
	end

	def edit
		@article = Article.find(params[:id])
		#hi
	end

	def create
	    @article = Article.new(article_params)
	 
	    if @article.save
	      redirect_to @article
	    else
	      render 'new'
	  end
	end

	def update
	    @article = Article.find(params[:id])
	 
	    if @article.update(article_params)
	      redirect_to @article
	    else
	      render 'edit'
	  end
	end

	def destroy
	    @article = Article.find(params[:id])
		@article.destroy
		 
		redirect_to articles_path
	end

	def show
		@article = Article.find(params[:id])
		#out of all the articles we have, we want to find the ones with params of id which we get from
	end

	private def article_params
		params.require(:article).permit(:title, :text)
		#require article, but only permite title and text parameters
	end
end
