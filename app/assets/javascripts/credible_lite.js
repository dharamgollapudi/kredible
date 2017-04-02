window.CredibleLite = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var submissionRouter = new CredibleLite.Routers.Submissions();
    Backbone.history.start();

    submissionRouter.navigate("/submissions/new", {trigger: true})
  }
};

$(document).ready(function(){
  CredibleLite.initialize();
});
