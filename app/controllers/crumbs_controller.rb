class CrumbsController < ApplicationController
  before_action :set_crumb, only: [:show, :edit, :update, :destroy]

  def index
    @crumbs = Crumb.all
    @crumb = Crumb.new
  end

  def show
  end

  def new
    @crumb = Crumb.new
  end

  def edit
  end

  def create
    @crumb = Crumb.new(crumb_params)
    @crumb.user_id = current_user.id

    respond_to do |format|
      if @crumb.save
        format.html { redirect_to crumbs_path, notice: 'Crumb was successfully created.' }
        format.json { render :show, status: :created, location: @crumb }
      else
        format.html { render :new }
        format.json { render json: @crumb.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @crumb.update(crumb_params)
        format.html { redirect_to @crumb, notice: 'Crumb was successfully updated.' }
        format.json { render :show, status: :ok, location: @crumb }
      else
        format.html { render :edit }
        format.json { render json: @crumb.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @crumb.destroy
    respond_to do |format|
      format.html { redirect_to crumbs_url, notice: 'Crumb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_crumb
      @crumb = Crumb.find(params[:id])
    end

    def crumb_params
      params.require(:crumb).permit(:url)
    end
end
