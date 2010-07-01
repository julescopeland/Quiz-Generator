require 'spec_helper'

describe "/pages/home" do
  before(:each) do
    render 'pages/home'
  end

  #Delete this example and add some real ones or delete this file
  it "should have the text 'the worlds best pub quiz generator' in an h2 tag" do
    response.should have_tag('h2', %r[the worlds best pub quiz generator])
  end
end
