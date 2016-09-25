ewikiBD
    .filter('stringRes', function () {

        return function (key) {
            var strings = {
                'article': 'Article',
                'articlesList': 'Article List',
                'articlesHeader': 'Article Management',
                'articlesSubheader': 'Articles',

                'category': 'Category',
                'categoriesList': 'Category List',
                'categoriesHeader': 'Category Management',
                'categoriesSubheader': 'Categories',

                'homeLinkText': 'Dashboard'
            };
            return strings[key] || key;
        };

    })
    .filter('log', function () {
        return function (data) {
            console.log(data);
        };
    });