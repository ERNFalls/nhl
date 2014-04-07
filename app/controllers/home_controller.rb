class HomeController < ApplicationController
  
  layout "main"

  def create_folder
    Dir.mkdir"/home/ernie/workspaces/test" unless File.exists? "/home/ernie/workspaces/Test"
  end

  def search
    @search = Sunspot.search(Contact, Case, Client, InsuranceCarrier, MedicalProvider, User) do |s|
      s.fulltext(params[:search])
    end
    @results = @search.results
  end

end
