CredibleLite.Models.Submission = Backbone.Model.extend({
  url: function() {
    if (this.get('id')) {
      return 'api/submissions/' + this.get('id');
    } else {
      return 'api/submissions';
    }
  },

  defaults: {
    "name":  "",
    "phone": "",
    "address": "",
    "ssn": "",
    "income": null,
    "credit_score": null,
    "amount": null
  }
});
