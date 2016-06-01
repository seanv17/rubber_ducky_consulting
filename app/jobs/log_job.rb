class LogJob
  include SuckerPunch::Job

  def perform(user)
    StripeCache.new(user).refresh
  end
end
