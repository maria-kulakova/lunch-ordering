document.addEventListener('turbolinks:load', () => {
  const formElement = document.querySelector('.simple_form.edit_menu');

  if (formElement) {
    new Menus(formElement).init();
  }
});

class Menus {
  constructor(formElement) {
    this.createMenuItemsForm = formElement;
    this.formAddFieldsButtons = this.createMenuItemsForm.querySelectorAll(
      '.add_fields',
    );
    this.formRemoveRecordButtons = this.createMenuItemsForm.querySelectorAll(
      '.remove_record',
    );
    this.formFields = document.querySelectorAll('.fields');

    this.init = this.init.bind(this);
    this.hideMenuItemFields = this.hideMenuItemFields.bind(this);
    this.appendNewMenuItemFields = this.appendNewMenuItemFields.bind(this);
  }

  init() {
    this.formAddFieldsButtons.forEach(addFieldButton => {
      addFieldButton.addEventListener('click', this.appendNewMenuItemFields);
    });

    $('form').on('click', '.remove_record', this.hideMenuItemFields);
  }

  hideMenuItemFields(event) {
    event.target.previousElementSibling.value = '1';
    event.target.closest('tr').style.display = 'none';

    return event.preventDefault();
  };

  appendNewMenuItemFields(event) {
    const time = new Date().getTime();
    const regexp = new RegExp(event.target.dataset.id, 'g');

    this.formFields.forEach(field => {
      field.insertAdjacentHTML(
        'beforeend',
        event.target.dataset.fields.replace(regexp, time),
      );
    });

    return event.preventDefault();
  };
}
