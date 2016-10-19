console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});

// Add another console log here, outside your AJAX request
console.log("testing");

// request gets sent right when the page loads it
// response comes back after this file finishes running - testing prints before weather
// current weather in New York:
  // humidity:73
  // pressure:1023.2
  // sea_level:1026.62
  // temp:294.412
  // temp_max:294.412
  // temp_min:294.412
  // wind speed:3.57
  // description:"clear sky"
// page did not refresh
