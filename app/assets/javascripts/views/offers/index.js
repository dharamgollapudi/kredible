CredibleLite.Views.OffersIndex = Backbone.View.extend({

  template: HandlebarsTemplates['offers/index'],

  events: {
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    this.$el.html(this.template({
      offers: this.model.toJSON()
    }));

    return this;
  }
});
