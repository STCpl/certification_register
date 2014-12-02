Certification Register
===============

#ToDo
Trello board: https://trello.com/b/KHNNmeQ2/certification-register-app

##Requires
 - Postgres 9.1 database (may work on others, hasn't been tested)
 - Ruby 2.1

##Thinking

Certification naming should really be 'Certificate'. In any case...

Types of Certificates -> Classifications Of Certificates -> Certification
Drivers License -> R open -> JB's R open's Driver's License

##Database Diagram
<tt>bundle exec erd</tt> to generate the database layout - erd.pdf
https://github.com/voormedia/rails-erd

 ##How to Deploy
 
 bundle exec cap production deploy