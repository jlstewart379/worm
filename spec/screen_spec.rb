require  'screen'
require 'multi_json'
require 'spec_helper'

describe Screen do

  let(:json) {MultiJson.load('{"frame":{"size":{"width":768,"height":1024},"origin":{"x":0,"y":0}},"uid":1,"backgroundColor":{},"isHidden":0,"subviews":[{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":44,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"testLabel","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UIView"},{"frame":{"size":{"width":768,"height":1024},"origin":{"x":0,"y":0}},"uid":1,"backgroundColor":{},"isHidden":0,"accessibilityLabel":"buttonLabel1","subviews":[],"tag":0,"isKeyWindow":1,"accessibilityFrame":{},"windowLevel":0,"alpha":1,"autoresizingMask":0,"class":"UIButton"},{"frame":{"size":{"width":768,"height":1024},"origin":{"x":0,"y":0}},"uid":1,"backgroundColor":{},"isHidden":0,"accessibilityLabel":"buttonLabel2","subviews":[],"tag":0,"isKeyWindow":1,"accessibilityFrame":{},"windowLevel":0,"alpha":1,"autoresizingMask":0,"class":"UIButton"},{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":2,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"textField1","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UITextField"},{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":2,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"textField2","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UITextField"},{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":2,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"imageView1","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UIImageView"},{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":2,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"imageView2","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UIImageView"}],"tag":0,"isKeyWindow":1,"accessibilityFrame":{},"windowLevel":0,"alpha":1,"autoresizingMask":0,"class":"UIWindow"}')}
  let(:server){Frank::Cucumber::Gateway.any_instance.stub(:send_get).with('dump').and_return(json)}
  let(:screen){ screen = Screen.new(json)}

  let(:json1) {MultiJson.load('{"frame":{"size":{"width":768,"height":1024},"origin":{"x":0,"y":0}},"uid":1,"backgroundColor":{},"isHidden":0,"accessibilityLabel":"buttonLabel1","subviews":[],"tag":0,"isKeyWindow":1,"accessibilityFrame":{},"windowLevel":0,"alpha":1,"autoresizingMask":0,"class":"UIButton"}')}
  let(:server1){Frank::Cucumber::Gateway.any_instance.stub(:send_get).with('dump').and_return(json)}
  let(:screen1){ screen = Screen.new(json)}

  context 'getting views' do
    it 'can get all the views' do
      screen.all_views.count == 2
    end
    it 'can get a view by id' do
      screen.view_by_id(1).should == json
    end
    it 'can get a nested view by id' do
      screen.view_by_id(44).should == MultiJson.load('{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":44,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"testLabel","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UIView"}')
    end
    it 'can get a view by label' do
      screen.view_by_label("testLabel").should == MultiJson.load('{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":44,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"testLabel","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UIView"}')
    end
    it 'can get a nested view by label' do
      screen.view_by_label('buttonLabel1').should == MultiJson.load('{"frame":{"size":{"width":768,"height":1024},"origin":{"x":0,"y":0}},"uid":1,"backgroundColor":{},"isHidden":0,"accessibilityLabel":"buttonLabel1","subviews":[],"tag":0,"isKeyWindow":1,"accessibilityFrame":{},"windowLevel":0,"alpha":1,"autoresizingMask":0,"class":"UIButton"}')
    end
  end
  context 'getting view properties by label' do
    it 'can get the view class' do
      screen.view_class("testLabel").should == "UIView"
    end
    it 'can get the nested view class' do
      screen.view_class("textField1").should == "UITextField"
    end
    it 'can get the view width' do
      screen.view_frame_width("testLabel").should == 148
    end
    it 'can get the view height' do
      screen.view_frame_height("testLabel").should == 888
    end
    it 'can get the view visibility' do
      screen.view_is_visible("testLabel").should be_true
    end
    it 'can get the view x-coordinates' do
      screen.view_x("testLabel").should == 20
    end
    it 'can get the view y-coordinates' do
      screen.view_y("testLabel").should == 0
    end
    it 'can get the view tag' do
      screen.view_tag("testLabel").should == 0
    end
    it 'can get the view accessibility frame height' do
      screen.view_accessibility_height("testLabel") == 444
    end
    it 'can get the view accessibility frame width' do
      screen.view_accessibility_height("testLabel") == 555
    end
  end
  context 'getting view properties from raw json' do
    it 'can get the class from raw view data' do
      screen.get_class(json1).should == "UIButton"
    end
    it 'can get the accessibility label from raw view data' do
      screen.get_label(json1).should == "buttonLabel1"
    end
  end
  context 'getting all view elements by type' do
    it 'can get a list of all the buttons on the screen' do
      screen.accessible_buttons.should == ["buttonLabel1", "buttonLabel2"]
    end

    it 'can get a list of all the text fields' do
      screen.accessible_text_fields.should == ["textField1", "textField2"]
    end

    it 'can get all the accessible images' do
      screen.accessible_images.should == ["imageView1", "imageView2"]
    end
  end
end


