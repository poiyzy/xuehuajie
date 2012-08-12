class TimelineEvent < Hashie::Mash
  def read!
    self.read = true
  end
end
