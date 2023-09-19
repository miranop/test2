class BooksController < ApplicationController
  before_action :set_Book, only: [:show,:edit,:update,:destroy]

  def create
    @newbook= Book.new(books_params)#データを入力し、新規登録するため
    if @newbook.save#データベースに保管するためのセーブ
      redirect_to book_path(@newbook.id)
      flash[:notice] ='Book was successfully created.'
    else
      @book = Book.all
      render :index
    end
  end



  def index
    @book=Book.all
    @newbook =Book.new
  end

  def show
  end


  def edit
  end
  
  def update
    if @book.update(books_params)
      redirect_to book_path(@book.id)
      flash[:update]= 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    if @book.destroy
      flash[:notice]= 'Book was successfully destroyed.'
    end
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title,:body)
  end
  def set_Book
    @book = Book.find(params[:id])
  end
end

