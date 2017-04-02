CredibleLite.Views.SubmissionShow = Backbone.View.extend({

  template: HandlebarsTemplates['submissions/show'],

  events: {
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);

    this.offersView = new CredibleLite.Views.OffersIndex({
      model: this.model.offers,
      parent: this
    });
  },

  render: function() {
    this.$el.html(this.template({
      submission: this.model.toJSON()
    }));

    this.offersView.setElement(this.$el.find(".offers"));
    this.model.offers.fetch();

    return this;
  }
});
