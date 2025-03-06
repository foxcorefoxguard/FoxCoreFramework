function orderParts() {
    let supplier = document.getElementById("supplier").value;
    let part = document.getElementById("part").value;
    let quantity = document.getElementById("quantity").value;

    fetch(`https://foxcore_mechanic/orderParts`, {
        method: "POST",
        body: JSON.stringify({ supplier: supplier, part: part, quantity: quantity })
    });

    alert("Order placed!");
}
