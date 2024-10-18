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
    editDescriptionLink.addEventListener('click', (event) => {
     event.preventDefault();

      descriptionText.style.display = 'none';
      descriptionInput.style.display = 'block';
    });
  }



  const titleTask = document.getElementById('title-task')
  const titleInput = document.getElementById('title-input')


  if (titleTask) {
    titleTask.addEventListener('click', () => {
      titleTask.style.display = 'none';
      titleInput.style.display = 'block';
      titleInput.querySelector('input').focus();
    });

    if (titleInput) {
      const titleField = titleInput.querySelector('input');

      // Gère le cas où l'utilisateur clique en dehors de l'input
      titleField.addEventListener('blur', () => {
        titleTask.style.display = 'block';
        titleInput.style.display = 'none';

        // Soumettre automatiquement le formulaire quand l'utilisateur quitte le champ
        document.getElementById('edit-title-form').submit();
      });
    }
  }


});
