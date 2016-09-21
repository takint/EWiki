/**
 * WikiImageCtrl - controller
 * @param {object} $scope TBD.
 * @param {object} $rootScope TBD.
 * @param {object} $state TBD.
 * @param {object} $http TBD.
 * @param {object} Upload TBD.
 * @param {object} cloudinary TBD.
 * @param {object} WikiImage TBD.
 * ngFileUpload already loaded
 */
function WikiImageCtrl($scope, $rootScope, $state, $http, Upload, cloudinary, WikiImage) {
    var _self = this;
    _self.WikiImage = new WikiImage();
    _self.WikiImage.GetAllWikiImages();

    $scope.title = '';
    $scope.description = '';
    $scope.fileProgress = 0;

    $scope.uploadFiles = function (files) {
        $scope.files = files;

        if (!$scope.files || $scope.files.length > 2) {
            return;
        }

        angular.forEach(files, function (file) {
            if (file && !file.$error) {
                file.upload = Upload.upload({
                    url: "https://api.cloudinary.com/v1_1/ewiki-io/upload",
                    data: {
                        upload_preset: cloudinary.config().upload_preset,
                        api_key: cloudinary.config().api_key,
                        api_secret: cloudinary.config().api_secret,
                        tags: 'pokemon',
                        context: 'photo=' + $scope.title,
                        file: file
                    }
                }).progress(function (e) {
                    var progressValue = e.loaded * 100.0 / e.total;

                    $scope.fileProgress = Math.round(progressValue);
                    file.status = "Uploading... " + $scope.fileProgress + "%";
                }).success(function (data, status, headers, config) {

                    $rootScope.photos = $rootScope.photos || [];
                    file.result = data;
                    $rootScope.photos.push(data);

                    var image = {
                        BitDepth: 24,
                        CreatedDate: '2016-09-20',
                        ImageName: data.original_filename + '-' + $scope.title,
                        ImageSize: data.bytes,
                        ImageWidth: data.width,
                        ImageHeight: data.height,
                        ImageMediaType: data.format,
                        ImageMime: 'image/png',
                        ImageDescription: $scope.description,
                        ImageUrl: data.url
                    };

                    $.ajax({
                        url: apiBaseUrl +'wikiimage/add',
                        method:"post",
                        data: image
                    }).success(function (data) {
                        _self.WikiImage.images.push(data);
                    });

                }).error(function (data, status, headers, config) {
                    file.result = data;
                });
            }
        });
    };
}