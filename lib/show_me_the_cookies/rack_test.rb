class ShowMeTheCookies::RackTest
  def initialize(rack_test_driver)
    @rack_test_driver = rack_test_driver
  end

  def show_me_the_cookies
    cookie_jar.instance_variable_get(:@cookies).map(&:inspect).join("\n")
  end

  def delete_cookie(cookie_name)
    cookie_jar.instance_variable_get(:@cookies).reject! do |existing_cookie|
      existing_cookie.name.downcase == cookie_name
    end
  end

private
  def cookie_jar
    @rack_test_driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  end
end