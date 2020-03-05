require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  scenario "各ビューをブラウザで表示する" do
    base_title = "InstagramTaskApp"
    
    visit root_url
    # expect(page.title).to  eq  base_title
    expect(page).to        have_title base_title
    expect(page).to        have_link  count: 2,             href: root_path
    expect(page).to        have_link  "InstagramTask App",  href: root_path
    expect(page).to        have_link  "Home",               href: root_path
    expect(page).to        have_link  "Help",               href: help_path
    expect(page).to        have_link  "About",              href: about_path
    expect(page).to        have_link  "Contact",            href: contact_path
    
    visit help_url
    expect(page.title).to eq "Help | #{base_title}"
    
    visit about_url
    expect(page.title).to eq "About | #{base_title}"
    
    visit contact_url
    expect(page.title).to eq "Contact | #{base_title}"
    
    visit signup_url
    expect(page.title).to eq "Sign up | #{base_title}"
  end
end
