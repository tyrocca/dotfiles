module.exports = {
    "extends": "airbnb",
    // "extends": "eslint-config-airbnb-base",
    // "extends": "eslint-config-airbnb",
    // "parser": "babel-eslint",
    // "installedESLint": true,
    "env": {
        "browser": true,
        "node": true,
        "commonjs": true,
        "jquery": true,
        "es6": true,
    },
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true,
            "classes": true,
        }
    },
    "plugins": [
        "react",
        "jsx-a11y",
        "import",
    ],
    "rules": {
        "semi": ["error", "never"],  // No semi colon
        "indent": [2, 4, { "SwitchCase": 1 }],  // this makes it so we have 4 spaces
        "jsx-a11y/no-static-element-interactions": 0,  // http://bit.ly/2dfwD8t
        "no-else-return": 1,  // error -> warning for else return
        "no-param-reassign": 1,  // error -> warning for mutating an object in a function
        "quotes": 0,  // this allows any type of quotes
        "react/jsx-indent": [2, 4],  // sets 4 spaces for jsx
        "react/jsx-indent-props": [2, 4],  // sets 4 spaces for jsx
        "react/no-multi-comp": 1,  // error -> warning for multi react in file
        "react/no-unused-prop-types": 1,
        "react/require-extension": "off",
        "new-cap": [
            2,
            {
                "capIsNewExceptions": [
                    "Map",
                    "List",
                    "Set",
                    "GET",
                    "POST",
                    "PATCH",
                    "PUT",
                ]
            }
        ],
    },
};
