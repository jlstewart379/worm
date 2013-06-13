class Screen

  def initialize(screen_data = nil)
    if screen_data.nil?
      @screen_data = MultiJson.load(Frank::Cucumber::Gateway.new.send_get('dump'))
    else
      @screen_data = screen_data
    end
  end

  def all_views
    add_views(@screen_data)
    @views
  end

  def add_views(json)
    json["subviews"].each do |view|
      add_view view
      add_views(view) unless view["subviews"].count == 0
    end
  end

  def view_by_id_with_data(json, id)
    if json["uid"].eql?(id)
      json
    else
      json["subviews"].each do |view|
        view_by_id_with_data(view, id)
      end
    end
  end

  def view_by_label(label)
    view_by_label_with_data(@screen_data, label)
  end

  def view_by_label_with_data(json,label)
    if json["accessibilityLabel"].eql? label
      json
    else
      json["subviews"].each do |view|
        view_by_label_with_data(view,label)
      end
    end
  end

  def view_class(label)
    view_by_label(label)[0]["class"]
  end

  def view_frame_width(label)
    view_frame(label)["size"]["width"]
  end

  def view_frame_height(label)
    view_frame(label)["size"]["height"]
  end

  def view_frame(label)
    view_by_label(label)[0]["frame"]
  end

  def view_is_visible(label)
    view_by_label(label)[0]["isHidden"] == 0
  end

  def view_by_id(id)
    view_by_id_with_data(@screen_data, id)
  end

  def view_x(label)
    view_by_label(label)[0]["accessibilityFrame"]["origin"]["x"]
  end

  def view_y(label)
    view_by_label(label)[0]["accessibilityFrame"]["origin"]["y"]
  end

  def view_origin(label)
    view_by_label(label)
  end

  def view_tag(label)
    view_by_label(label)[0]["tag"]
  end

  def view_accessibility_height(label)
    view_by_label(label)[0]["accessibilityFrame"]["size"]["height"]
  end

  def view_accessibility_width(label)
    view_by_label(label)[0]["accessibilityFrame"]["size"]["width"]
  end

  def get_class(view_data)
    view_data["class"]
  end

  def get_label(view_data)
    view_data["accessibilityLabel"]
  end

  def accessible_buttons
    buttons = []
    all_views.each do |view|
      if get_class(view).include? 'Button'
        buttons << get_label(view) unless get_label(view).nil?
      end
    end
    buttons
  end

  def accessible_text_fields
    texts = []
    all_views.each do |view|
      if get_class(view).include? 'UITextField'
        texts << get_label(view) unless get_label(view).nil?
      end
    end
    texts
  end

  private
  def add_view(view)
    @views = [] unless @views
    @views << view
  end
end