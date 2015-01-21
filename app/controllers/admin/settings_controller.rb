class Admin::SettingsController < AdminController
  before_action :set_admin_setting, only: [:show, :edit, :update, :destroy]

  def index
    @settings = Templates.all
  end

  def new
    @setting = Templates.new
  end

  def edit
  end

  def create
    @setting = Templates.new(admin_setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_to edit_admin_setting_path(@setting), notice: 'Setting was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @setting.update(admin_setting_params)
        format.html { redirect_to admin_settings_path, notice: 'Setting was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to admin_settings_path, notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_setting
      @setting = Templates.find(params[:id])
    end

    def admin_setting_params
      params.require(:templates).permit(:image, :value)
    end
end
