require 'spec_helper'

describe "mainoptions/edit" do
  before(:each) do
    @mainoption = assign(:mainoption, stub_model(Mainoption,
      :name => "MyString",
      :image => "",
      :show => false,
      :description => "MyString"
    ))
  end

  it "renders the edit mainoption form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mainoption_path(@mainoption), "post" do
      assert_select "input#mainoption_name[name=?]", "mainoption[name]"
      assert_select "input#mainoption_image[name=?]", "mainoption[image]"
      assert_select "input#mainoption_show[name=?]", "mainoption[show]"
      assert_select "input#mainoption_description[name=?]", "mainoption[description]"
    end
  end
end
