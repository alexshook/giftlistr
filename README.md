#giftlistr

<hr>

### Unique gift ideas based on lifestyle.

Giftlister recommends unique gifts for the hard-to-buy-for people in your life. Anyone can browse giftlistr's product listings by category, but users with accounts have access to giftlists where they can save gift ideas for a specific person.

Next I want to connect the Facebook Graph API and use the data on a user's friends list to return gift recommendations.



## Links

* [Pivotal Tracker User Stories](https://www.pivotaltracker.com/s/projects/1047136)
* [ERD (photo)](http://i.imgur.com/mJn0t0X.jpg)
* [giftlistr on heroku (old version)](http://afternoon-castle-3081.herokuapp.com/)


## Technologies

* [Simple Form](https://github.com/plataformatec/simple_form)
* [ffaker](https://github.com/EmmanuelOga/ffaker)
* [Factory Girl](https://github.com/thoughtbot/factory_girl_rails)
* [Devise](https://github.com/plataformatec/devise)
* [Paperclip](https://github.com/thoughtbot/paperclip)
* S3
* Rails
* PostgreSQL




## User Stories
<ol>
  <li>As a user, I should be able to sign up for an account so that I can have full access to the app.</li>
  <li>As a logged in user, I should be able to create giftlists from gifts on the site so that I can keep track of gift ideas for people I know.</li>
  <li>As a logged in user, I should be able to add gifts to giftlists and specify if they're for a particular person so that I can easily keep track of more than one gift idea per person.</li>
  <li>As a logged in user, I should be able to search for gifts by tags so that I can more easily navigate the gifts available on the site.</li>
  <li>As a user, I should be able to browse products by tag without logging in so that I can get an idea of what the site is about before signing up.</li>
</ol>


### Backlog
<ol>
  <li>As a user, I should be able to sort through gifts by price and category so that they're easier to find.</li>
  <li>As a logged in user, I should be able to edit my user profile so that I can have a good social sharing experience with other users on the site. </li>
  <li>As a logged in user, I should be able to anonymously message my friends so that I can ask them about gifts they want for upcoming birthdays, holidays, etc.</li>
  <li>As an admin user, I should have special privileges like setting the featured gifts on the home page, the ability to message all users, the ability to delete products, etc.</li>
</ol>


### Changes
* Added paperclip, S3, imagemagick
* Some kind of S3 bucket error is happening, explore further
* Reverted to a previous commit
* Added devise for users and admins
* Set custom controller for devise users
* Modified filters to user decise helpers
* Seeded (previously dropped database before adding devise)
* DRYed up giftlists form with partial
* Edited README
* Added new and create actions for gifts (but not sure I want to keep them)
* New way of displaying tags (checkboxes) but params are not being passed through so need to fix
* Added update and destroy actions for tags
* Added basic validations
* Added delete button for tags
* Minor changes to controllers
* Edited note for rake notes