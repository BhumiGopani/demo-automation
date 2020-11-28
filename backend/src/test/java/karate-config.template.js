function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  karate.configure("ssl", true)

  var config = {
    baseurl: 'BASE_URL'
  };

  return config;
}
