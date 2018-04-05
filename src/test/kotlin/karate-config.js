function() {
    var env = karate.env; // get java system property 'karate.env'
    if (!env) {
        env = 'dev'; // a custom 'intelligent' default
    }
    karate.log('karate.env system property was:', env);

    var config = { // base config JSON

    };

    return config;
}