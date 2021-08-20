module JobsHelper
  def expired(time)
   time < Date.today
  end
end
