/*
 * This is a manifest file that'll be compiled into application.js, which will include all the files
 * listed below.
 * 
 * Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
 * or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
 *
 * It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 * compiled file.
 * 
 * Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
 * about supported directives.
 */
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

// make JSLint happy
/* global $ */

$(document).ready(function () {
    $('.dropdown-toggle').dropdown();
});

function search() {
    var input = $('#inputField').val();
    if (input.length > 0) {
        var search = $('#inputField').val();
        // visit this "page" (i.e., activate a route within Rails)
        var location = ('/search?type=song&q=' + search)
        window.location = (location);
    }
}

function saveLyrics() {
    
}

window.addEventListener('turbolinks:load', function () {
    
    // ENTER key is equivalent to search button click
    $('#inputField').keypress(function(e){
          if(e.keyCode==13) {
            e.preventDefault(); 
            $('#searchButton').click();
          }
    });

    // check for null since we may not be on the page we expect to be
    var searchButton = $('#searchButton');
    if (searchButton !== null) {
        searchButton.on('click', search);
    }
    
    var saveLyricsButton = $('#saveLyrics');
    if (saveLyricsButton !== null) {
        saveLyricsButton.on('click', saveLyrics);
    }
});
