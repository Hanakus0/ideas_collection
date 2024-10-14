class Admin::PostRecordsController < ApplicationController
  before_action :set_admin_post_record, only: %i[ show edit update destroy ]

  # GET /admin/post_records or /admin/post_records.json
  def index
    @admin_post_records = PostRecord.all
  end

  # GET /admin/post_records/1 or /admin/post_records/1.json
  def show
  end

  # GET /admin/post_records/new
  def new
    @admin_post_record = PostRecord.new
  end

  # GET /admin/post_records/1/edit
  def edit
  end

  # POST /admin/post_records or /admin/post_records.json
  def create
    @admin_post_record = PostRecord.new(admin_post_record_params)

    respond_to do |format|
      if @admin_post_record.save
        format.html { redirect_to @admin_post_record, notice: "Post record was successfully created." }
        format.json { render :show, status: :created, location: @admin_post_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_post_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/post_records/1 or /admin/post_records/1.json
  def update
    respond_to do |format|
      if @admin_post_record.update(admin_post_record_params)
        format.html { redirect_to @admin_post_record, notice: "Post record was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_post_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_post_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_records/1 or /admin/post_records/1.json
  def destroy
    @admin_post_record.destroy!

    respond_to do |format|
      format.html { redirect_to admin_post_records_path, status: :see_other, notice: "Post record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post_record
      @admin_post_record = PostRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_post_record_params
      params.require(:admin_post_record).permit(:post_id, :view_count)
    end
end
