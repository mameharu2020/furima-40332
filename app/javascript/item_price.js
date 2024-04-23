document.addEventListener("turbo:load", function(){
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const feeOutput = document.getElementById('add-tax-price');
    const addTaxDom = document.getElementById("profit");

    const fee = Math.floor(inputValue * 0.1)
    const profit = Math.floor(inputValue - fee)

    feeOutput.innerHTML = fee.toLocaleString();
    addTaxDom.innerHTML = profit.toLocaleString();
  })
 })