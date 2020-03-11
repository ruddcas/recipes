# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Recipe-
-	recipe should be valid
-	name should be present
-description should be present
-maximum and minimum length for name and description

Cheefs-
	Chefs have chefsname (username), email
	Chefs have a one-to-many association with redipes
	Chefs can be created from console
	We have a test suite to test chef model

	Chefs cont-
	Ability to sign-up chefs to use CRUD operations
	Show profile page
	Secured Login and Logout
	Apply restrictions to the app for CRUD operations
	Admin login and secure page
	Add password digest



Test-
-	chefname should be present
-	email should be present
-	max & min length on email, chefname should be valid
-	email format should be valid
-	email should be unique and case insensitive
