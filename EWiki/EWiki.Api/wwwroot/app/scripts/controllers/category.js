/**
 * CategoryCtrl - controller
 * @param {object} $scope TBD.
 * @param {object} $rootScope TBD.
 * @param {object} $state TBD.
 * @param {object} DTOptionsBuilder TBD.
 * @param {object} Category TBD.
 */
function CategoryCtrl($scope, $rootScope, $state, DTOptionsBuilder, Category) {
    var _self = this;

    _self.Category = new Category();
    _self.Category.GetAllCategories();

    $scope.dtOptions = DTOptionsBuilder.newOptions()
         .withDOM('<"html5buttons"B>lTfgitp')
         .withButtons([
             {
                 text: 'Add new Category',
                 action: function (e, dt, node, config) {
                     $state.go('index.category-details');
                 }
             }
         ]);
}