class ArticlesController < ApplicationController

    # On the /article/, list the Articles
    def index
        @articles = Article.all
      end

    # Show article of specified id with the route params
    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def create
        # render plain: params[:article].inspect

        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
        else
            # Force user get back to the register page if error
            render 'new'
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
