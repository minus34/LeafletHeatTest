/*
 * CC Copyright 2014 Hugh Saalmans <info@minus34.com>
 * http://www.minus34.com/
 * 
 * Postgres 9.3 scripts used to generate point and suburb data
 * https://github.com/minus34/LeafletHeatTest
 */

var map;
 
function init(){

  // show points loading message until data downloaded (~8mb)
	var $loading = $('#loading').hide();
	$(document)
		.ajaxStart(function () {
			$loading.show();
		})
		.ajaxStop(function () {
			$loading.hide();
			
			// create heatmap:
			// alpha will equal 1 for values >= maxValue; alphaRange 0 gives the full spectrum of colours, autoresize supports windows resizing
			var heatmap = new L.TileLayer.WebGLHeatMap({maxValue:1000, opacity:0.4, alphaRange:0, autoResize:true});
			heatmap.setData(points);
			map.addLayer(heatmap);
		});

	// create the map and set the view
	map = L.map('map', { maxZoom: 15 });
	map.setView([-31, 149], 5);
	
	// acknowledge data and open source providers
	map.attributionControl.addAttribution('Heatmap libs &copy; <a href="http://www.ursudio.com/">@ursudio</a>');
	map.attributionControl.addAttribution('<a href="http://codeflow.org/entries/2013/feb/04/high-performance-js-heatmaps/">@pyalot</a>');
	map.attributionControl.addAttribution('Census data &copy; <a href="http://www.abs.gov.au/websitedbs/D3310114.nsf/Home/%C2%A9+Copyright">ABS</a>');
	
  // add MapBox tiles
	var tiles = L.tileLayer('http://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
			attribution: '<a href="https://www.mapbox.com/about/maps/">MapBox Terms &amp; Feedback</a>',
			id: 'examples.map-20v6611k'
	}).addTo(map);

	// load heatmap points
	jQuery.ajax({
				url: "points.js",
				dataType: "script",
				cache: true
	})	
}
