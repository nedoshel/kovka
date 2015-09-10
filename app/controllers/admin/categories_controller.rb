class Admin::CategoriesController < AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @categories = Category.all
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # GET /admin/categories/1/edit
  def edit
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Category.new(admin_category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to [:admin, @category], notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location:[:admin, @category] }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    respond_to do |format|
      if @category.update(admin_category_params)
        format.html { redirect_to [:admin, @category], notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @category] }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_category
      @category = Category.find(params[:id])
    end

    def admin_category_params
      params.require(:category).permit(:title, :subdomain, :seo_title, :price_list, :seo_description, :seo_keywords, :category_spec,
        :header_addit, :firm_purpose, :footer_text, :image, :h1_text, :counter, article_ids: [])
    end
end
