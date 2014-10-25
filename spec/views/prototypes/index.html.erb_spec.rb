require 'spec_helper'

describe "prototypes/index" do
  before(:each) do
    assign(:prototypes, [
      stub_model(Prototype,
        :name => "Name",
        :image => "",
        :show => false
      ),
      stub_model(Prototype,
        :name => "Name",
        :image => "",
        :show => false
      )
    ])
  end

  it "renders a list of prototypes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
