class ArticlesController < ApplicationController
  
  def new 
      @article = Article.new
  end
  
  def create
    # code below is used to show what is being return from the create method not needed for pgm....
    #render plain: params[:article].inspect
    
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
    end
    
    
    private
      def article_params
        params.require(:article).permit(:title, :description)
        
      end
      
end