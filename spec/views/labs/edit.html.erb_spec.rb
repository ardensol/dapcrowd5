require 'spec_helper'

describe "labs/edit" do
  before(:each) do
    @lab = assign(:lab, stub_model(Lab,
      :name => "MyString",
      :image => "",
      :show => false,
      :description => "MyString"
    ))
  end

  it "renders the edit lab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lab_path(@lab), "post" do
      assert_select "input#lab_name[name=?]", "lab[name]"
      assert_select "input#lab_image[name=?]", "lab[image]"
      assert_select "input#lab_show[name=?]", "lab[show]"
      assert_select "input#lab_description[name=?]", "lab[description]"
    end
  end
end
