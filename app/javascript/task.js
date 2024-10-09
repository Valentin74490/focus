document.addEventListener('turbo:load', () => {
  const popup = document.getElementById("popupfocus");
  const closepopup = document.getElementById("closepopup");

  if (popup) {
    // Animation pour ouvrir le popup
    setTimeout(() => {
      popup.classList.remove("translate-x-[600px]", "hidden");
      popup.classList.add("translate-x-0");
    }, 20);
  }

  if (closepopup) {
    closepopup.addEventListener("click", () => {
      console.log("Bouton de fermeture cliqué !");

      popup.classList.remove("translate-x-0");
      popup.classList.add("translate-x-[600px]");

     
      setTimeout(() => {
        popup.classList.add("hidden");
      }, 150);
    });
  }
});
