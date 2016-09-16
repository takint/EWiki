ewikiBD
    .filter('stringRes', function () {

        return function (key) {
            var strings = {
                'example': 'Example Test'
            };
            return strings[key] || key;
        };

    });