CredibleLite.Routers.Submissions = Backbone.Router.extend({
  routes: {
    "": "toNewSubmission",
    "submissions/new": "newSubmission",
    "submissions/:id": "showSubmission"
  },

  regions: {
    ".main-content": null
  },

  toNewSubmission: function() {
    this.navigate("/submissions/new", {trigger: true});
  },

  newSubmission: function() {
    var view = new CredibleLite.Views.SubmissionsNew();

    // render view
    this._renderRegion(".main-content", view);
  },

  showSubmission: function(id) {
    // instantiate the submission model
    var submission = new CredibleLite.Models.Submission({
      id: id
    });

    // instantiate the offers collection and set it on the submission
    var offers = new CredibleLite.Collections.Offers();
    offers.submission = submission;
    submission.offers = offers;

    // instantiate the view
    var view = new CredibleLite.Views.SubmissionShow({
      model: submission
    });

    // render view
    this._renderRegion(".main-content", view);

    // fetch the submission
    submission.fetch();
  },

  // utility functions, to fake a simple regions mechanism
  _renderRegion: function(regionId, view) {
    this._setRegion(regionId, view);
    $(regionId).html(view.render().el);
  },

  _removeRegion: function(regionId) {
    if (this.regions[regionId]) {
      this.regions[regionId].remove();
    }
  },

  _setRegion: function(regionId, view) {
    this._removeRegion(regionId);
    this.regions[regionId] = view;
  }
});
