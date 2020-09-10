# NEXT STEPS

  # Problems to fix:

 

  * assigned to C: add an attribute to the Race model so it knows who created it
    * you should only be allowed to edit/delete races you created
  * assigned to C: add an attribute to the Registration model so the Runner can mark as completed and input their finish time or distance (manually, at least for now)
  * assigned to C: adjust column names/types to eliminate ambiguity when it comes to units

  * make sure flash[:errors] and flash[:success] show up as appropriate and redirects make sense
  ^ MOSTLY DONE 
  * validations
  ^ will work on these as soon as final versions of models are in

  
  * assigned to A: button to sign up for a race should change to removing yourself from the race if you've already signed up
  ^ DONE
  * assigned to A: button to add friend should change to delete friend (with accompanying functionality) if you're already friends
  ^ DONE
    * assigned to A: button should not show up at all if it's your own profile
  ^ DONE
  * assigned to A: as long as you're logged in you can edit or delete anyone's profile -- this is very bad!!!
    * fix so you can only edit/delete your own
  ^ DONE

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
  ^ DONE
  * when a runner wins or loses against another runner in a race, their ranking changes accordingly (start by implementing for two-person races, then get the algorithm to accommodate more competitors)
  ^ DONE

  * allow runners to challenge those within their category
  ^ almost certainly skipping this
  * allow runners to challenge their friends
  ^ this too

  
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

let's figure out the flow for demonstrating the app and modify views accordingly:
IF TIME: HOMEPAGE
we'll start by going to a random page, oops we're not logged in, let's actually just create an account
bootstrapped --> 'sessions/new'
bootstrapped --> 'runners/new'
check out our profile page, we've been sorted into a category and we start out with points at the bottom of the category 
bootstrapped --> 'runners/show'
might be worth signing up for some races, let's see what's out there
bootstrapped --> '/races'
'races/show' (should show runners and their categories/points and completed?)
friend the person who created it, they seem cool
'runners/show'
and while we're at it, might as well create a race of our own
'races/new'
now we're signed up for two races
'runners/show'
for the race that already existed before, we'll preseed with some finish times by other runners
pretend we've finished it too, input our own finish time
'registrations/edit'
now logout, log back in as the person who created that race
'sessions/logout'
'sessions/login'
check out their points and ranking compared to others
'races/show'
they see oh cool everyone's done with the race let's close it out
'races/edit'
now go back to the rankings, cool our point value has changed, it's all been adjusted a bit
'races/show'
'/rank_categories'
'rank_categories/show'


add friend and edit profile and delete account buttons 


add migration for profile photo


careful seeding