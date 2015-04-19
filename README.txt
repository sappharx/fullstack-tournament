0) using your shell 'cd' into the repository's root directory
1) run 'vagrant up' to build your VM
2) run 'vagrant ssh' to access your VM
3) run 'cd /vagrant/tournament' to move into the shared directory with the code files
4) run 'psql' to launch the psql program and access its shell
6) once in the psql shell run '\i tournament.sql' to create the database
   - your output will say that 2 tables and 3 views are created, but they are NOT; you will need to complete the following steps:
   a) run '\c tournament' to connect the tournament database
   b) run '\i tournament.sql' again to actually create the tables and views
      - you should get an error saying 'database "tournament" already exists"; don't worry about it
7) run '\q' to exit psql
8) back in your shell run 'python tournament_test.py' to run all the unit tests
All tests should pass.