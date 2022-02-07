window.addEventListener('DOMContentLoaded', () => {
    const confirmationInput = document.getElementById("confirm_delete_user");
    const deleteAccountButton = document.getElementById("delete-account-button");

    if (confirmationInput) {
        confirmationInput.addEventListener("input", function(event) {
            deleteAccountButton.disabled = event.target.value !== "delete";
        });
    } else {
        console.warn("confirmationInput isn't found");
    }
});
