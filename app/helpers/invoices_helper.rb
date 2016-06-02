module InvoicesHelper

  def yesno(x)
    x ? "Paid" : "Unpaid"
  end

  def authenticate_admin
    redirect_to home_path, alert: 'Not authorized.' unless current_user[:role] == User.roles[:admin]
  end

end
