class HomeController < ApplicationController
  def index
  end
  def footer
    render:"footer"
  end
  def header
    render:"header"
  end
  def api
      @response = {
        :status => 200,
        :messages => "hello world"
      }
      render json: @response
  end

