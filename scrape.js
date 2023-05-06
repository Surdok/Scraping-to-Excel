["price", "size"].forEach((v) => {
  [...document.querySelectorAll("." + v + "-info")].forEach((element) => {
    element.innerText = "";
  });
});
var prices = [...document.querySelectorAll(".struct-price__dis")].map((v) => parseFloat(v.innerText.split("BD")[1]));

var textItems = [...document.querySelectorAll(".info")].map((v) => v.innerText.replaceAll("\n", " "));

var urls = [...document.querySelectorAll(".img-box img")].map((v) => v.src);

copy(prices.map((v, i) => [v, textItems[i], urls[i]].join(",")).join("\n"));
