CredibleLite.Collections.Offers = Backbone.Model.extend({
  url: function() {
    return 'api/submissions/' + this.submission.get('id') + '/offers';
  },

  defaults: {
    "submission":  null
  },

  parse: function(result) {
    return result.offers;
  }
});
