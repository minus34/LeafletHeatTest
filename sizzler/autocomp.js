/*
 * jQuery UI Autocomplete: Using Label-Value Pairs
 * http://salman-w.blogspot.com/2013/12/jquery-ui-autocomplete-examples.html
 */

$(function() {
	$("#autocomplete1").autocomplete({
		source: subs,
		minLength: 2,
		//autoFocus: true,
		
		focus: function(event, ui) {
			// prevent autocomplete from updating the textbox
			//event.preventDefault();
			// manually update the textbox
			//$(this).val(ui.item.label);
		},
		select: function(event, ui) {
			// prevent autocomplete from updating the textbox
			event.preventDefault();
			// manually update the textbox and hidden field
			$(this).val(ui.item.label);
			
			var boundsArray = ui.item.value;
			//console.log(boundsArray);
			
			var southWest = L.latLng(boundsArray[1], boundsArray[0]),
					northEast = L.latLng(boundsArray[3], boundsArray[2]),
					bounds = L.latLngBounds(southWest, northEast);
			
			var newZoom = map.getBoundsZoom(bounds, false) - 2;

			// console.log(newZoom);
			// console.log(bounds.getCenter());
			
			map.setView(bounds.getCenter(), newZoom);
		}
	});

	// Overrides the default autocomplete filter function to search only from the beginning of the string
	$.ui.autocomplete.filter = function (array, term) {
			var matcher = new RegExp("\\b" + $.ui.autocomplete.escapeRegex(term), "i");
			return $.grep(array, function (value) {
					return matcher.test(value.label || value.value || value);
			});
	};
	
	$("#autocomplete1").on("click", function () {
		$(this).select();
	});
	
});

