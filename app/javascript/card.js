const pay = () => {
  Payjp.setPublicKey("pk_test_0236c11aff457aeef9514ac6");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        console.log(response)
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name", "order_address[number]");
      document.getElementById("card-cvc").removeAttribute("name", "order_address[cvc]");
      document.getElementById("card-exp-month").removeAttribute("name", "order_address[exp_month]");
      document.getElementById("card-exp-year").removeAttribute("name", "order_address[exp_year]");
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);