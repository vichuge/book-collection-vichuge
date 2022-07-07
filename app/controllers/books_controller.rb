class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_url, notice: 'Saved!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_url, notice: 'Updated!' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book deleted!' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:name, :author)
  end
end
