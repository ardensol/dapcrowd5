class StoreCreditsController < ApplicationController
	
	before_filter :authenticate_user!
  	before_filter :verify_admin
    prepend_before_filter :set_remaining_amount, :only => [:create, :update]


    def index
    @store_credits = StoreCredit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @store_credits }
    end
  end

  def show
    @store_credit = StoreCredit.find(params[:id])
   
   	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store_credit }
    end
  end

  def new
    @store_credit = StoreCredit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @store_credit }
    end
  end

  def edit
    @store_credit = StoreCredit.find(params[:id])
  end

  def create
    @store_credit = StoreCredit.new(params[:store_credit])

    respond_to do |format|
      if @store_credit.save
        format.html { redirect_to @store_credit, notice: 'Store Credit was successfully created.' }
        format.json { render json: @store_credit, status: :created, location: @store_credit }
      else
        format.html { render action: "new" }
        format.json { render json: @store_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @store_credit = StoreCredit.find(params[:id])

    respond_to do |format|
      if @store_credit.update_attributes(params[:store_credit])
        format.html { redirect_to @store_credit, notice: 'Store Credti was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @store_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store_credit = StoreCredit.find(params[:id])
    @store_credit.destroy

    respond_to do |format|
      format.html { redirect_to store_credits_url }
      format.json { head :no_content }
    end
  end














    protected
      def permitted_resource_params
        params.require(:store_credit).permit(permitted_store_credit_attributes)
      end

   	private
   

    def set_remaining_amount
      params[:store_credit][:remaining_amount] = params[:store_credit][:amount] if params[:store_credit]
    end

    def permitted_store_credit_attributes
      [:user_id, :amount, :reason, :remaining_amount]
    end

end