class ExpendituresController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @expenditures = @category.expenditures.order(updated_at: params[:order] || :desc)
    @total_amount = @expenditures.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @expenditure = @category.expenditures.build
  end

  def create
    @expenditure =Expenditure.new(expenditure_params)
    @category = Category.find(params[:category_id])
    @expenditure.author = current_user
    @expenditure.categories << @category

    if @expenditure.save
      flash[:notice] = 'expenditure was successfully created!'
    else
      flash[:alert] = 'expenditure could not be created!'
    end

    redirect_to category_expenditures_path
  end

  private

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount, :author_id)
  end
end
