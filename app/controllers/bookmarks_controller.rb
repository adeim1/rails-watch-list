class BookmarksController < ApplicationController
  before_action :set_list

  def new
    @bookmarks = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
