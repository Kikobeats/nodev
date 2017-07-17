# NODEV

[![Greenkeeper badge](https://badges.greenkeeper.io/Kikobeats/nodev.svg)](https://greenkeeper.io/)

### node.js Development Environment v0.0.2

    ##############
    # NODEJS DEV #
    ##############

     usage: nodev [option] [command] <file_name>

     files:
      <file_name>: Run Node.js with persistent update (with supervisor by default)

     commands:
      status: view global status
      debug [port]: Run debug (forever+node-inspector). Default port: 9999
      redis: Run REDIS
      mongo: Run MongoDB
      off: kill all services

     options
      --usage supervisor: By default supervisor is the default library
      --usage nodemon: Use nodemon instead of supervisor

     NOTE: with nodemon you can restart the server in any moment with 'rs' command
  	
 
Example of usage (run in independents terminal windows):

	nodev redis
	nodev mongo
	nodev debug
	nodev server.js

now, local server is ready with debug interace in ttp://127.0.0.1:9999/debug?port=5858

when you terminate the development kill all instances with
	
	nodev off


### SYSTEM Dependencies:

	nodejs
	redis
	mongoDB
	

### NPM Dependencies:

	npm install -g supervisor
	npm install -g node-inspector
	npm install -g nodemon
	npm install -g forever
		
### Nodemon or Supervisor?

By default the script use supervisor instead of nodemon. But you can change it:

	nodev --usage nodemon

	
### Add it in your PATH

Download the project folder and put it in your $HOME path

add this line in ~/.bash_profile:
	
	# node_dev settings
	PATH=$PATH:$HOME/node_dev
	