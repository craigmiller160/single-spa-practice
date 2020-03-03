const webpackMerge = require("webpack-merge");
const singleSpaDefaults = require("webpack-config-single-spa-react");

module.exports = webpackConfigEnv => {
  const defaultConfig = singleSpaDefaults({
    orgName: "react-mf",
    projectName: "api",
    webpackConfigEnv
  });

  return webpackMerge.smart(defaultConfig, {
    externals: [
      "rxjs",
      "axios"
    ]
    // modify the webpack config however you'd like to by adding to this object
  });
};
