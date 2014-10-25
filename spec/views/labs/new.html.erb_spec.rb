require 'spec_helper'

describe "labs/new" do
  before(:each) do
    assign(:lab, stub_model(Lab,
      :name => "MyString",
      :image => "",
      :show => false,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new lab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", labs_path, "post" do
      assert_select "input#lab_name[name=?]", "lab[name]"
      assert_select "input#lab_image[name=?]", "lab[image]"
      assert_select "input#lab_show[name=?]", "lab[show]"
      assert_select "input#lab_description[name=?]", "lab[description]"
    end
  end
end
