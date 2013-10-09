# node.js Development Environment v0.0.1

Set up your node.js development environment!

	nodev <command>
	
With none command show the help. Example:


 	##############
 	# NODEJS DEV #
 	##############

 	Uso: /Users/josefranciscoverdugambin/node_dev/nodev <comando>

  	* [nombre_fichero]: Arranca Node.js con actualización persistente (supervisor)
  	* debug: Arranca el debug (forever+node-inspector)
  	* redis: Arrancar el REDIS
  	* mongo: Arranca MongoDB
  	* off: Detiene todos los servicios
  	
 
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

	npm-install -g supervisor
	npm-install -g node-inspector
	
### Add it in your PATH

Download the project folder and put it in your $HOME path

add this line in ~/.bash_profile:
	
	# node_dev settings
	PATH=$PATH:$HOME/node_dev

### TODO

	Command ON for run secuencies commands in differents terminal.	

	