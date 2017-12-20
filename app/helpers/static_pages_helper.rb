module StaticPagesHelper

  private

    def static_page_params
      params.require(:static_page).permit(:name, :permalink, :content)
    end
end
