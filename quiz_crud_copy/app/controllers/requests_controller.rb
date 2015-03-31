class RequestsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]


  def index
    Request.order("done DESC")
    if params[:search]
      @requests = Request.search(params[:search])
    else
      @requests = Request.all
    end
  end

  def new
    @request = Request.new
  end


  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path(@request), notice: "Support Request submitted succesfully"
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to request_path(@request), 
      notice: "Supporter request has been succesfully updated"
    else
      flash[:alert] = "Please correct the errors below"
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: "Request has been deleted"
  end
 

  private
  def find_post
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name, :email, :department, :message, :done)
  end

end
