/*
 * jQuery UI Autocomplete: Using Label-Value Pairs
 * http://salman-w.blogspot.com/2013/12/jquery-ui-autocomplete-examples.html
 */

$(function() {
	$("#autocomplete1").autocomplete({
		source: subs,
		minLength: 3,
		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox
			$(this).val(ui.item.label);
		},
		select: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox and hidden field
			$(this).val(ui.item.label);
			
			var boundsArray = ui.item.value;
			
			console.log(boundsArray);
			
			//[153.02644, -27.36821, 153.05263, -27.34954] 
			
			var southWest = L.latLng(boundsArray[1], boundsArray[0]),
					northEast = L.latLng(boundsArray[3], boundsArray[2]),
					bounds = L.latLngBounds(southWest, northEast);
			
			var newZoom = map.getBoundsZoom(bounds, false) - 1;

			console.log(newZoom);
			console.log(bounds.getCenter());
			
			map.setView(bounds.getCenter(), newZoom);

			}
	});
});