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

# Stat attributes:

These are just the attributes for now -- we'll need to iron them out later once we figure out what format this will take. 

* Stat Type (speed, distance, etc)
* Statistic (the actual number)
* Unit
* Runner ID

# Functionality:

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
    * mark the race as completed and input their finish time
  * view a list of the races they've created
    * edit or delete a race as long as no one else has signed up
  
  * view a list of their friends
    * delete a friend

--

# A's confusing list of todos (ignore)

* add units to race length, elevation changes?
* fix the stats table to actually match what a stat should look like

runnerscontroller DONE
  * still need to be able to see relationship related info, like stats, friends, registrations, etc
racescontroller DONE
  * still need to be able to see who's signed up etc
registrationscontroller DONE
  * need to show the user they've signed up successfully
  * need to add a way to destroy registrations
friendshipscontroller (for when you add someone as a friend) DONE

ok we'll save these for later:
rankcategoriescontroller (for showing the different category options and who's in them)
statscontroller (for when you input a new stat/race data)

button syntax for posterity:
<%= button_to "Like", post_path(@post), method: :patch, params: { :post => {:likes => (@post.likes + 1) } }%>