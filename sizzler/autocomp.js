/*
 * jQuery UI Autocomplete: Using Label-Value Pairs
 * http://salman-w.blogspot.com/2013/12/jquery-ui-autocomplete-examples.html
 */

$(function() {
	$("#autocomplete1").autocomplete({
		source: subs, // loaded from suburbs2011.js
		minLength: 2, // 2 user keystrokes before anything happens

		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();		
		},
		
		select: function(event, ui) {
			event.preventDefault();
			
			// update the textbox with the selected item
			$(this).val(ui.item.label);

			// change the map extents to the extents of the suburb/town, minus 2 zoom levels for a more useful map
			var boundsArray = ui.item.value;
			
			var southWest = L.latLng(boundsArray[1], boundsArray[0]),
					northEast = L.latLng(boundsArray[3], boundsArray[2]),
					bounds = L.latLngBounds(southWest, northEast);
			
			var newZoom = map.getBoundsZoom(bounds, false) - 2;
			
			map.setView(bounds.getCenter(), newZoom);
		}
	});

	// override the default autocomplete filter to search only from the beginning of each word
	$.ui.autocomplete.filter = function (array, term) {
			var matcher = new RegExp("\\b" + $.ui.autocomplete.escapeRegex(term), "i");
			return $.grep(array, function (value) {
					return matcher.test(value.label || value.value || value);
			});
	};
	
	// highlight the current text when user clicks on the textbox for overwriting
	$("#autocomplete1").on("click", function () {
		$(this).select();
	});
});
