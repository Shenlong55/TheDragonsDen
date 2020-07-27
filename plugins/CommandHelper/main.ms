######################################################
#
#   Sample Main file. This file is run when the server
#   starts up, or the plugin is reloaded. It can be used
#   as an opportunity to register events or do other things
#   when the server initially starts. Variables defined here
#   will go out of scope, so you can't assign something and
#   then use it in a command, for instance.
#
######################################################

@server_name = '<Server Name>';

# Echo out a server greeting to the console
#console('Welcome to this server, which is running CommandHelper! (Change this message in plugins/CommandHelper/main.ms)');

# Bind an event to the player join, and tell ops hello.
# We send in @server_name, so we can use it inside the event handler
#bind('player_join', null, null, @event, @server_name) {
	# If the player is an op, let's send them a welcome message
	#if(pisop(@event['player'])) {
		#msg('Welcome to '.@server_name.' (Change this message in plugins/CommandHelper/main.ms)');
	#}
#}

register_command('plotselect', array('description': 'Select a plot.',
                                'usage': '/plotselect',
                                'noPermMsg': 'You do not have permission to select a plot.',
                                'executor': closure(@alias, @sender, @args) {
                                    if(array_size(@args) < 1) {
                                        sudo('//chunk');
                                        sudo('//expand 1 n,e,s,w');
                                        sudo('//chunk -s');
                                        msg(colorize('&aPlot selected.  If you are happy with your selection use /plotclaim <plotName> to claim this land as your own.'));
                                        
                                        return(true);
                                    }
                                    return(false); // prints usage
                                }
                            ));
                            
register_command('plotclaim', array('description': 'claim a plot.',
                                'usage': '/plotclaim <plotName>',
                                'noPermMsg': 'You do not have permission to claim a plot.',
                                'executor': closure(@alias, @sender, @args) {
                                    if(array_size(@args) > 0) {
                                        sudo('/rg claim '.@args[0]);
                                        sudo('//desel');
                                        
                                        return(true);
                                    }
                                    return(false); // prints usage
                                }
                            ));