class Admin::QuoteRelationsController < ApplicationController
  before_action :set_admin_quote_relation, only: %i[ show edit update destroy ]

  # GET /admin/quote_relations or /admin/quote_relations.json
  def index
    @admin_quote_relations = QuoteRelation.all
  end

  # GET /admin/quote_relations/1 or /admin/quote_relations/1.json
  def show
  end

  # GET /admin/quote_relations/new
  def new
    @admin_quote_relation = QuoteRelation.new
  end

  # GET /admin/quote_relations/1/edit
  def edit
  end

  # POST /admin/quote_relations or /admin/quote_relations.json
  def create
    @admin_quote_relation = QuoteRelation.new(admin_quote_relation_params)

    respond_to do |format|
      if @admin_quote_relation.save
        format.html { redirect_to @admin_quote_relation, notice: "Quote relation was successfully created." }
        format.json { render :show, status: :created, location: @admin_quote_relation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_quote_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/quote_relations/1 or /admin/quote_relations/1.json
  def update
    respond_to do |format|
      if @admin_quote_relation.update(admin_quote_relation_params)
        format.html { redirect_to @admin_quote_relation, notice: "Quote relation was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_quote_relation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_quote_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/quote_relations/1 or /admin/quote_relations/1.json
  def destroy
    @admin_quote_relation.destroy!

    respond_to do |format|
      format.html { redirect_to admin_quote_relations_path, status: :see_other, notice: "Quote relation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_quote_relation
      @admin_quote_relation = QuoteRelation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_quote_relation_params
      params.require(:admin_quote_relation).permit(:post_id, :post_id)
    end
end
