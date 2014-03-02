class CodesController < ApplicationController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def code_params
      params[:code].permit(:type, :code)
    end
end
