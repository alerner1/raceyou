# NEXT STEPS

  # Problems to fix:

  * assigned to A: as long as you're logged in you can edit or delete anyone's profile -- this is very bad!!!
    * fix so you can only edit/delete your own
  * assigned to C: add an attribute to the Race model so it knows who created it
    * you should only be allowed to edit/delete races you created
  * assigned to C: add an attribute to the Registration model so the Runner can mark as completed and input their finish time or distance (manually, at least for now)
  * assigned to A: button to sign up for a race should change to removing yourself from the race if you've already signed up
  * assigned to A: button to add friend should change to delete friend (with accompanying functionality) if you're already friends
  * assigned to C: adjust column names/types to eliminate ambiguity when it comes to units
  * validations
  * make sure flash[:errors] and flash[:success] show up as appropriate and redirects make sense

  # Views to fix:

  * should be able to see who's signed up for a given race

--

# Domain model:

* a Runner can have many Races through Registrations
* a Race can have many Runners through Registrations
* a Registration belongs to a Runner and a Race
* a Runner can have many Stats (basically their PBs)
* a Runner belongs to a RankCategory
* a Runner can have many Friends (aka other Runners) through Friendships

# Runner attributes:

* Name
* Age
* Gender
* Rank Category ID (bronze, silver, gold, etc)
* Rank (within that category)
* Username
* Email
* Password (via password_digest)

# Race attributes:

* Race Type (speed, distance, etc)
* Length
* Elevation increase
* Elevation decrease
* Expiration date

# Registration attributes:

* Runner ID
* Race ID
* Completed (true/false)
* Place (that the runner earned, calculated after race has expired)

# Friendship attributes:

* Runner ID (aka runner #1)
* Friend ID (aka runner #2)

# RankCategory attributes:

* literally just the name

# Basic Functionality/Views:

  * create a new account ('/runners/new')
  * login ('/sessions/login')
  * logout ('/logout')

  # Races

  * view a list of all races ('/races')
  * click on a race to view its show page ('/races/:id')
  * sign up for a race from its show page
  * back out of a race
  
  # Runners

  * view a list of all runners ('/runners')
  * click on a runner to view their profile ('/runners/:id')
  * add another runner as a friend
  * edit their own profile 
  * delete their own account
  
  * view a list of the races they've signed up for
    * mark the race as completed and input their finish time/distance
  * view a list of the races they've created
    * edit or delete a race as long as no one else has signed up
  
  * view a list of their friends
    * delete a friend

  # Rank Categories

  * view a list of all runners in each category, sorted by rank within that category

# Complex Methods

  * assign runners to a category based on their race records
  * allow runners to challenge those within their category
  * allow runners to challenge their friends
  * when a runner wins or loses against another runner in a race, their ranking changes accordingly (start by implementing for two-person races, then get the algorithm to accommodate more competitors)
  
# Stretch Goals

  * integrate workout history and race records with Strava
  * view workout/race route on Google Maps

--

# A's confusing list of todos (ignore)

* add units to race length, elevation changes?

runnerscontroller DONE
  * still need to be able to see relationship related info, like friends, registrations, etc
racescontroller DONE
  * still need to be able to see who's signed up etc
registrationscontroller DONE
  * need to show the user they've signed up successfully
  * need to add a way to destroy registrations
friendshipscontroller (for when you add someone as a friend) DONE
rankcategoriescontroller (for showing the different category options and who's in them) DONE

button syntax for posterity:
<%= button_to "Like", post_path(@post), method: :patch, params: { :post => {:likes => (@post.likes + 1) } }%>