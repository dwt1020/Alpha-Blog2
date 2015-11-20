class ArticlesController < ApplicationController
  
  def new 
      @article = Article.new
  end
  
  def create
    # code below is used to show what is being return from the create method not needed for pgm....
    #render plain: params[:article].inspect
    
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was succesfully created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end  # if  
  end
    
  def show
    @article = Article.find(params[:id])
    
  end
    
    private
      def article_params
        params.require(:article).permit(:title, :description)
        
      end
      
end