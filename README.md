## Rails-todo-app

ToDo App in Ruby on Rails.

* Ruby version: 3.0.1

* Rails: 6.1.3.1

This is the third app in a series of apps I'm building. It will always be the same app but build in different technologies.

Live Site: [https://tg-rails-todo-app.herokuapp.com/projects]

You can create and delete projects and tasks within these projects. Tasks can be edited, deleted and set to "complete".
The projects and tasks get saved to postgresql.

The UI is responsive and I used mainly css-grid for that.

The main exercise in creating this app was practicing TDD. After completing it, I must say i really like the Workflow of TDD. What I mean by this is the red-green-refactor loop.  First you write a failing test for the behavior you want. Then you write the code to make it pass, only concerning yourself with making the test pass and not with code quality at all. Then, once the test is passing, go back to the code and refactor it to make it nice. 

My main ressource for TDD was Jason Swett: [https://www.codewithjason.com/]
I used RSpec and Capybara.


Multiple Projects:

![image](https://user-images.githubusercontent.com/49613341/116769092-fa0dd380-aa39-11eb-84ea-0a1d8384ff86.png)


Tasks within project:

![image](https://user-images.githubusercontent.com/49613341/116769423-48bc6d00-aa3c-11eb-99c4-fd6bcc19d6f1.png)
