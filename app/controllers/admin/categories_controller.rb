class Admin::CategoriesController < ApplicationController

  def index
      @categories = Category.order(id: :desc).all
  end

  def new
      @category = Category.new
  end

  def create
      @category = Category.new(category_params)

      if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
      else
      render :new
      end

  end
  def category_params
      params.require(:category).permit(
      :name,
      :created_at, 
      :updated_at
      )
    end
end 

# from schema.rb:
# create_table "categories", force: :cascade do |t|
#   t.string   "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end