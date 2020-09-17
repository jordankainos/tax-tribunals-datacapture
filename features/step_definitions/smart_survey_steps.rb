And("that I'm on the home page and wants to give feedback") do
  home_page.load_page
  feedback_tab = window_opened_by { click_link 'Report a problem' }
end
