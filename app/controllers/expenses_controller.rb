class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
     @expenses = User.find(current_user.id).expenses
     if params[:concept].present? && !params[:category_id].present?
     	@expenses = @expenses.where("concept LIKE :concept", concept: "%#{params[:concept]}%")
     	elsif params[:concept].present? && params[:category_id].present?
     		@expenses = @expenses
     		.where("concept LIKE :concept", concept: "%#{params[:concept]}%")
     		.where("category_id = #{params[:category_id]}")
     	elsif params[:category_id].present?
     		@expenses = @expenses.where("category_id = #{params[:category_id]}")
     end
  end
end
