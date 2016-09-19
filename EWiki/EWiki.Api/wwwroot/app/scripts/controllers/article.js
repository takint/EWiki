/**
 * ArticleCtrl - controller
 * @param {object} $scope TBD.
 * @param {object} $rootScope TBD.
 * @param {object} $state TBD.
 * @param {object} DTOptionsBuilder TBD.
 * @param {object} Article TBD.
 */
function ArticleCtrl($scope, $rootScope, $state, DTOptionsBuilder, Article) {
    var _self = this;

    _self.Article = new Article();
    _self.Article.GetAllArticles();

    $scope.dtOptions = DTOptionsBuilder.newOptions()
         .withDOM('<"html5buttons"B>lTfgitp')
         .withButtons([
             {
                 text: 'Add new Article',
                 action: function (e, dt, node, config) {
                     $state.go('index.article-details');
                 }
             }
         ]);
}