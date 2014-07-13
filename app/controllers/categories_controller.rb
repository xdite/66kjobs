class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    set_page_title "#{@category.name} 相關 66K 工作"
  end
end
