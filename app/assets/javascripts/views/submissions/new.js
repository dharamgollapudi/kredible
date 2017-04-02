CredibleLite.Views.SubmissionsNew = Backbone.View.extend({

  template: HandlebarsTemplates['submissions/new'],

  events: {
    "submit form": "newSubmission"
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  newSubmission: function(e) {
    e.preventDefault();

    // get the form
    var form = $(e.target);

    // put together the model
    var submission = new CredibleLite.Models.Submission();
    submission.set("name", form.find("#name").val());
    submission.set("phone", form.find("#phone").val());
    submission.set("address", form.find("#address").val());
    submission.set("ssn", form.find("#ssn").val());
    submission.set("income", form.find("#income").val());
    submission.set("credit_score", form.find("#credit_score").val());
    submission.set("amount", form.find("#amount").val());

    submission.save(null, {
      success: function() {
        var submissionRouter = new CredibleLite.Routers.Submissions();
        submissionRouter.navigate('/submissions/' + submission.get('id'), {trigger: true});
      }
    });
  }
});
