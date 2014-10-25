require 'spec_helper'

describe "labs/show" do
  before(:each) do
    @lab = assign(:lab, stub_model(Lab,
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
