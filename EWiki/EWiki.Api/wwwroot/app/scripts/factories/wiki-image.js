/**
 * WikiImage - factory
 * @param {object} $http to make ajax call.
 * @return {object} Article wrapper.
 */
function WikiImageFactory($http) {
    var WikiImage = function () {
        this.images = [];
        this.busy = false;
        this.skip = 0;
        this.take = 30;
    };

    // apiBaseUrl is set in app.js
    WikiImage.prototype.GetAllWikiImages = function () {
        var _self = this;
        var url = apiBaseUrl + 'wikiimage';

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
            var images = data;

            if (images.length !== 0) {
                images.forEach(function (item) {
                    _self.images.push(item);
                });

                _self.busy = false;
                _self.skip += _self.take;
            }
        }).error(function (data, status, headers, config) {
            _self.busy = false;
        });
    };

    return WikiImage;
}