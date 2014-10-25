require 'spec_helper'

describe "mainoptions/index" do
  before(:each) do
    assign(:mainoptions, [
      stub_model(Mainoption,
        :name => "Name",
        :image => "",
        :show => false,
        :description => "Description"
      ),
      stub_model(Mainoption,
        :name => "Name",
        :image => "",
        :show => false,
        :description => "Description"
      )
    ])
  end

  it "renders a list of mainoptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
