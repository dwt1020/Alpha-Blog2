class ArticlesController < ApplicationController
  
  def new 
      @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
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
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was succesfully update"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  
    
    private
      def article_params
        params.require(:article).permit(:title, :description)
        
      end
      
end