MDF1
====
	Full Sail University
	Mobile Development Course
	Bachelor of Science
	Instructor: Wendy Jones
	Student:  Monica Peters
	Mobile Development Frameworks 1

	XCode version 4.5.1
	Target iPhone & iPad iOS 6
	Mountain Lion OSX 10.8.2

PROJECT 1
==========
	Due: October 25th 2012
	Submitted to Teacher: October 24th 2012
	Verified it Builds, Compiles, and Runs for both iPhone & iPad Simulators, and actual iPad 2
	Video Review & Demo:  http://www.youtube.com/watch?v=P3J87oHlXDU&feature=youtu.be
	Your project will need to have the following features:
		A UILabel at the top with the title of your application. The UILabel should have a background color.
		A UITableView displaying a list of items. The data in this list can be anything you want. At least twenty items must be in the list initially.
		A custom UITableView Cell that contains at least one UIImageView and two strings.
		An edit button that allows for the removal/deletion of any item in the list. The edit button changes the UITableView to edit mode and shows the minus button for deletion.
		When clicking on an item in the list, move to a second view with more information about this item.
		Create your own icon for this application and add it to your project
		Create your own launch image default.png and add it to your project.

PROJECT 2
==========
	Due: November 2nd 2012
	Submitted to Teacher: October 30th 2012
	Video Review & Demo:
	Your project will need to have the following features:
		A UITabBarControl with at least three tabs. 
		     Home, Food, Info
		One of the tabs must contain a UINavigationController.
		     Home
		The child of navigation controller can contain any UI you wish but must have an option to push another view onto the navigationController stack.
		     see AppDelegate.h comments for how I accomplished this.
		One tab must use a UITableViewController and contain selectable data. This selectable data MUST then present a detail UIView displaying more information about this item.
		     Food Tab -> DetailView -> Custom Table Cell
		One tab can be free form UI.
		     Info Tab -> button links to webpage url for more info about raw vegan recipes
		Make sure to add in a default.png graphic and icon.
		     App icons and launch images included.
		Draw up a quick flow diagram of your UI and include it in your project.
		     MDF1/week2/mdf1_project2/mdf1_project2/UI-Diagram.png

PROJECT 3
==========
	Due:
	Video Review & Demo:
	Your project will need to have the following features:
		Your main UI should consist of a UITabBarControl with two tabs.
		First Tab view
			The first tab should have a UITableView with a list of ten or more locations for a fictional business.
			The TableView also should have an edit button allowing you to delete any of the locations in the list.
			When clicking on a business location in the list, transition to another view that has a map at the top of the page and the business location information at the bottom (lat, lon, business name)
			The map on this page should be centered on this business and a pin annotation should designate it's location. Please make sure your zoom level is appropriate.
			Clicking on the pin annotaton for this business will display the business name.
			You should be also able to return to the tableview by pressing the back button.
		Second Tab view
			The second tab view consists of a fullscreen map.
			The map will display a pin annotation for all of the business locations present in the tableview of the first tab. Hint: Keep track of the array of business locations in an object that is accessible to both tab views so the data is kept in sync.
			Clicking on a pin annotation will display the name of the business.

PROJECT 4
==========
	Due:
	Video Review & Demo:
	Your project will need to have the following features:
		Your main UI should consist of a UITabBarControl with two tabs.
		First Tab view
			When the application launches, using NSURLRequest, build a url and request data from a web service of your choice. The data from the request will be placed into a NSMutableData object. The request MUST be asynchronous.
			Parse this data using the NSXMLParser and place the data into objects appropriate for this type of data. Parser MUST parse the most current data from the server.
			Present the data in a UITableView. Each cell should represent one of the items in the xml. For instance, a list of movies, each cell would display the details for one movie.
			Selecting an item in the list will move to an item details view.
		Item detail view
			Using a UITextView, display the xml for this selected item as text.
		Second Tab view
			The second tab will consist of a single textview.
			The textview will need to display the XML that your application is parsing.
			This is being used as a way to debug the web service view.