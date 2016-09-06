## Pushback
##########
var pbLoop = func {
if(getprop("/sim/model/pushback/enabled"))
{
setprop("/controls/flight/rudder2", getprop("/controls/flight/rudder"));
}else
{
setprop("/controls/flight/rudder2", 0);
}

	settimer(pbLoop, 0);
 };
 

# start the loop 2 seconds after the FDM initializes

setlistener("sim/signals/fdm-initialized", func {
	settimer(func {
		pbLoop();
	}, 2);
});

