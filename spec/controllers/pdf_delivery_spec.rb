require 'spec_helper'

RSpec.describe ItemsController, type: :controller do
  it "sends a reqeust for a pdf file" do
    create(:item)

    get :index, format: :pdf
    
    expect(response.body).to include("PDF")
    expect(response.headers["Content-Transfer-Encoding"]).to eq("binary")
    expect(response.headers["Content-Disposition"]).to eq("inline; filename=\"caussa.pdf\"")
    expect(response.headers["Content-Type"]).to eq("application/pdf")
  end
end