class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "me", password: "secret", except: [:index]
	
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
	end

	def edit
 	 @article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		@article.save
		redirect_to articles_path
	end

	def update
		@article = Article.find(params[:id])
 
		@article.update(article_params)
	    redirect_to articles_path
	end

	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
 
  		redirect_to articles_path
end

	private
	def article_params
		params.require(:article).permit(:title, :text)
end
end
