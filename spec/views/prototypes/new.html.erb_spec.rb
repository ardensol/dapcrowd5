require 'spec_helper'

describe "prototypes/new" do
  before(:each) do
    assign(:prototype, stub_model(Prototype,
      :name => "MyString",
      :image => "",
      :show => false
    ).as_new_record)
  end

  it "renders new prototype form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", prototypes_path, "post" do
      assert_select "input#prototype_name[name=?]", "prototype[name]"
      assert_select "input#prototype_image[name=?]", "prototype[image]"
      assert_select "input#prototype_show[name=?]", "prototype[show]"
    end
  end
end
