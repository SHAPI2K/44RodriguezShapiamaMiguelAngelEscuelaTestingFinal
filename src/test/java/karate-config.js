function fn() {
    var env = karate.env || 'dev';
    karate.log('karate.env:', env);

    var config = {
        env: env,
        baseUrl: 'https://petstore.swagger.io/v2'
    };

    return config;
}