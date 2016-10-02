/**
 * Category - factory
 * @param {object} $http to make ajax call.
 * @return {object} Category wrapper.
 */
function CategoryFactory($http) {
    var Category = function () {
        this.categories = [];
        this.busy = false;
        this.skip = 0;
        this.take = 10;
    };

    // apiBaseUrl is set in app.js
    Category.prototype.GetAllCategories = function () {
        var _self = this;
        var url = apiBaseUrl + 'category';

        if (_self.busy) {
            return;
        }

        _self.busy = true;

        return $http.get(url, {
            params: {
                skip: _self.skip,
                take: _self.take
            }
        }).success(function (data) {
            var categories = data;

            if (categories.length !== 0) {
                categories.forEach(function (item) {
                    console.log(item);
                    _self.categories.push(item);
                });

                _self.busy = false;
                _self.skip += _self.take;
            }
        }).error(function (data, status, headers, config) {
            _self.busy = false;
        });
    };

    return Category;
}