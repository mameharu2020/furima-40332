document.addEventListener("input", function(event) {
  if (event.target.id === 'item-price') {
    const inputValue = event.target.value;
    const feeOutput = document.getElementById('add-tax-price');
    const addTaxDom = document.getElementById("profit");

    const fee = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue - fee);

    feeOutput.innerHTML = fee.toLocaleString();
    addTaxDom.innerHTML = profit.toLocaleString();
  }
});