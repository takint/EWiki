/**
 * Article - factory
 * @param {object} $http to make ajax call.
 * @return {object} Article wrapper.
 */
function ArticleFactory($http) {
    this.helloText = "This is article page";

    return Article;
}