# TODOS

* add units to race length, elevation changes?
* fix the stats table to actually match what a stat should look like

runnerscontroller DONE
  * still need to be able to see relationship related info, like stats, friends, registrations, etc
racescontroller DONE
  * still need to be able to see who's signed up etc
registrationscontroller DONE
  * need to show the user they've signed up successfully
  * need to add a way to destroy registrations
friendshipscontroller (for when you add someone as a friend)
rankcategoriescontroller (for showing the different category options and who's in them)
statscontroller (for when you input a new stat/race data)

button syntax for posterity:
<%= button_to "Like", post_path(@post), method: :patch, params: { :post => {:likes => (@post.likes + 1) } }%>