feature 'Follow/Unfollow a user' do
  before do
    sign_up(username: 'test_user')
    click_link 'Sign out'
    sign_up(email: 'mannieg@example.com', username: 'mannieg')
  end

  scenario 'A user can follow another user', :js => true, :focus => true do
    visit '/test_user'
    click_button 'Follow'
    expect(page).to have_content '1 following'
  end
end
