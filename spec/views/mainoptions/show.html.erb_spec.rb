require 'spec_helper'

describe "mainoptions/show" do
  before(:each) do
    @mainoption = assign(:mainoption, stub_model(Mainoption,
      :name => "Name",
      :image => "",
      :show => false,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/Description/)
  end
end
