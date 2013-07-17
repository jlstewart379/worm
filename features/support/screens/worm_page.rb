require 'furter'

class WormPage
  include Furter

  label(:label_worm, :label=>'wormLabel')
  views('WORMViewController')




end