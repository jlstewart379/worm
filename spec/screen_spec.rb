require  'screen'
require 'multi_json'
require 'spec_helper'

describe Screen do

  let(:json) {MultiJson.load('{"frame":{"size":{"width":768,"height":1024},"origin":{"x":0,"y":0}},"uid":1,"backgroundColor":{},"isHidden":0,"subviews":[{"frame":{"size":{"width":148,"height":888},"origin":{"x":20,"y":0}},"uid":2,"backgroundColor":"<NON-RGB COLOR>","isHidden":0,"accessibilityLabel":"testLabel","subviews":[],"tag":0,"accessibilityFrame":{"size":{"width":444,"height":555},"origin":{"x":20,"y":0}},"alpha":1,"autoresizingMask":36,"class":"UIView"}],"tag":0,"isKeyWindow":1,"accessibilityFrame":{},"windowLevel":0,"alpha":1,"autoresizingMask":0,"class":"UIWindow"}')}
  let(:server){Frank::Cucumber::Gateway.any_instance.stub(:send_get).with('dump').and_return(json)}
  let(:screen){ screen = Screen.new(json)}

  context 'getting views' do
    it 'can get all the views' do
      screen.all_views.count == 2
    end
    it 'can get a view by id' do
      screen.view_by_id(1).should == json
    end
    it 'can get a nested view by id' do
      screen.view_by_id_with_data(json, 2).should == [{"frame"=>{"size"=>{"width"=>148, "height"=>888}, "origin"=>{"x"=>20, "y"=>0}}, "uid"=>2, "backgroundColor"=>"<NON-RGB COLOR>", "isHidden"=>0, "accessibilityLabel"=>"testLabel", "subviews"=>[], "tag"=>0, "accessibilityFrame"=>{"size"=>{"width"=>444, "height"=>555}, "origin"=>{"x"=>20, "y"=>0}}, "alpha"=>1, "autoresizingMask"=>36, "class"=>"UIView"}]
    end
    it 'can get a view by label' do
      screen.view_by_label("testLabel").should == [{"frame"=>{"size"=>{"width"=>148, "height"=>888}, "origin"=>{"x"=>20, "y"=>0}}, "uid"=>2, "backgroundColor"=>"<NON-RGB COLOR>", "isHidden"=>0, "accessibilityLabel"=>"testLabel", "subviews"=>[], "tag"=>0, "accessibilityFrame"=>{"size"=>{"width"=>444, "height"=>555}, "origin"=>{"x"=>20, "y"=>0}}, "alpha"=>1, "autoresizingMask"=>36, "class"=>"UIView"}]
    end
  end
  context 'getting view properties by label' do
    it 'can get the view class' do
      screen.view_class("testLabel").should == "UIView"
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
end