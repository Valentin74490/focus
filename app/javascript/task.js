document.addEventListener('turbo:load', () => {
  const popup = document.getElementById("popupfocus");
  const closepopup = document.getElementById("closepopup");

  // Animation pour ouvrir le popup
  if (popup) {
    setTimeout(() => {
      popup.classList.remove("translate-x-[600px]", "hidden");
      popup.classList.add("translate-x-0");
    }, 20);
  }

  // Gestion de la fermeture du popup
  if (closepopup) {
    closepopup.addEventListener("click", () => {
      console.log("Bouton de fermeture cliqué !");

      // Animation pour fermer le popup
      popup.classList.remove("translate-x-0");
      popup.classList.add("translate-x-[600px]");

      // Cacher le popup après l'animation
      setTimeout(() => {
        popup.classList.add("hidden");
      }, 150);
    });
  }

  // Gestion de l'édition en ligne de la description
  const editDescriptionLink = document.getElementById('edit-description');
  const descriptionText = document.getElementById('description-text');
  const descriptionInput = document.getElementById('description-input');

  if (editDescriptionLink) {
    editDescriptionLink.addEventListener('click', function (e) {
      e.preventDefault();
      descriptionText.style.display = 'none';
      descriptionInput.style.display = 'block';
    });
  }
});
