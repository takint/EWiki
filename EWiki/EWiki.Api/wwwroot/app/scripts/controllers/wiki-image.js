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

                    file.progress = Math.round(progressValue);
                    file.status = "Uploading... " + progressValue + "%";
                }).success(function (data, status, headers, config) {

                    $rootScope.photos = $rootScope.photos || [];
                    file.result = data;
                    $rootScope.photos.push(data);

                    var fileName = $scope.title !== '' ? $scope.title : data.original_filename;
                    var description = fileName.replace(/(\d*)([^\d]*)/, function (match, p1, p2, offset, string) {
                        return [p1, p2].join(' - ');
                    });

                    var image = {
                        BitDepth: 24,
                        CreatedDate: '2016-09-25',
                        ImageName: fileName,
                        ImageSize: data.bytes,
                        ImageWidth: data.width,
                        ImageHeight: data.height,
                        ImageMediaType: data.format,
                        ImageMime: 'image/png',
                        ImageDescription: description,
                        ImageUrl: data.url
                    };

                    $.ajax({
                        url: apiBaseUrl +'wikiimage/add',
                        method:"post",
                        data: image
                    }).success(function (data) {
                        _self.WikiImage.images.push(data);
                    }).error(function (e) {
                        console.log(e);
                    });

                }).error(function (data, status, headers, config) {
                    file.result = data;
                });
            }
        });
    };
}