/* global axios */ 

var beerTemplate = document.querySelector("#beer-list");
var beerContainer = document.querySelector(".row");

axios.get("http://localhost:3000/api/beers").then(function(response) {
  var beers = response.data.beers;
  beers.forEach(function(beer) {
    console.log(beer, beer.supplier);
    var beerClone = beerTemplate.content.cloneNode(true);
    beerClone.querySelector(".card-title").innerText = beer.name;
    beerClone.querySelector(".card-text").innerText = beer.description;
    beerClone.querySelector(".card-img-top").src = beer.images;
    beerClone.querySelector("#price").innerText = beer.price;
    beerClone.querySelector("#brewer").innerText = beer.supplier.name;
    beerClone.querySelector("#available").innerText = beer.in_stock;
    beerContainer.appendChild(beerClone);

  });
});