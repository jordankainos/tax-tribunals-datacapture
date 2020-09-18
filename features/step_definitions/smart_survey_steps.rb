Given("that I'm on the home page and wants to give feedback") do
  home_page.load_page
end

Then("there should be a smart survey link at the top") do
  expect(home_page).to have_link('Report a problem', href: 'https://www.smartsurvey.co.uk/s/ETFBS20/')
end
