module.exports = {
    "extends": "airbnb",
    "parser": "babel-eslint",
    "installedESLint": true,
    "env": {
        "browser": true,
        "node": true,
        "commonjs": true,
        "es6": true,
    },
    "ecmaFeatures": {
        "classes": true,
        "jsx": true,
    },
    "plugins": [
        "react",
        "jsx-a11y",
        "import",
    ],
    "rules": {
        "quotes": 0,  // this allows any type of quotes
        "react/no-multi-comp": 1,  // error -> warning for multi react in file
        "no-param-reassign": 1,  // error -> warning for mutating an object in a function
        "react/no-unused-prop-types": 1,
        "indent": [2, 4],  // this makes it so we have 4 spaces
        "react/jsx-indent": [2, 4],  // sets 4 spaces for jsx
        "react/jsx-indent-props": [2, 4],  // sets 4 spaces for jsx
        "jsx-a11y/no-static-element-interactions": 0,  // http://bit.ly/2dfwD8t
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
