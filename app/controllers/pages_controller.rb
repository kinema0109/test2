class PagesController < ApplicationController
  def home
  end

  def about
  end
  def hello
    render html:" el mundo"
  end
end