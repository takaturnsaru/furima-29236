window.addEventListener("load", function(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('input', function() {
    const price = document.getElementById("item-price").value;
    const tax = price * 0.1;
    const profit = price * 0.9
    target = document.getElementById("add-tax-price");
    target.innerHTML = Math.floor(tax)
    output = document.getElementById("profit")
    output.innerHTML = Math.floor(profit)
  })
  })
