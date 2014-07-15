class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs
    set_page_title "#{@category.name} 相關 66K 工作"


    respond_to do |format|
      format.html
      format.rss
    end

  end
end
