class LayoutsController < ApplicationController
  before_action :set_layout, only: [:show, :update, :destroy]

  # GET /layouts
  def index
    @layouts = Layout.all

    render json: @layouts
  end

  # GET /layouts/1
  def show
    render json: @layout
  end

  # POST /layouts
  def create
    @layout = Layout.new(layout_params)

    if @layout.save
      render json: @layout, status: :created, location: @layout
    else
      render json: @layout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /layouts/1
  def update
    if @layout.update(layout_params)
      render json: @layout
    else
      render json: @layout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /layouts/1
  def destroy
    @layout.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layout
      @layout = Layout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def layout_params
      params.require(:layout).permit(:layout_name, :template_id, :user_id, :is_public)
    end
end
