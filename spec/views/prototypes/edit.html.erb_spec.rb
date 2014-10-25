require 'spec_helper'

describe "prototypes/edit" do
  before(:each) do
    @prototype = assign(:prototype, stub_model(Prototype,
      :name => "MyString",
      :image => "",
      :show => false
    ))
  end

  it "renders the edit prototype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", prototype_path(@prototype), "post" do
      assert_select "input#prototype_name[name=?]", "prototype[name]"
      assert_select "input#prototype_image[name=?]", "prototype[image]"
      assert_select "input#prototype_show[name=?]", "prototype[show]"
    end
  end
end
