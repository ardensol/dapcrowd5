require 'spec_helper'

describe "prototypes/show" do
  before(:each) do
    @prototype = assign(:prototype, stub_model(Prototype,
      :name => "Name",
      :image => "",
      :show => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
