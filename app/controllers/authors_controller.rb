class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  private
    def author_params
      params.require(:author).permit(:name, :country)
    end
end