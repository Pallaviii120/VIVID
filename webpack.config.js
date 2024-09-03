// webpack.config.js
const HtmlWebPackPlugin = require('html-webpack-plugin');
const path = require('path');
module.exports = {
    context: __dirname,
    entry: {
        dashboard: './public/assets/dist/dashboard.js',
        dept_master: './public/assets/dist/dept_master.js',
        addEmployee: './public/assets/dist/addEmployee.js',
        'attr-report': './public/assets/dist/attr-report.js',
        holiday_master: './public/assets/dist/holiday_master.js',
        leave: './public/assets/dist/leave.js',
        login: './public/assets/dist/login.js',
        mydashboard: './public/assets/dist/mydashboard.js',
        profile: './public/assets/dist/profile.js',
        punch_in: './public/assets/dist/punch_in.js',
        punch_out: './public/assets/dist/punch_out.js',
        shift_master: './public/assets/dist/shift_master.js',
        'task-report': './public/assets/dist/task-report.js',
        tasks_final: './public/assets/dist/tasks_final.js',
        tasks: './public/assets/dist/tasks.js',
        menus: './public/assets/dist/menus.js',
        emp_master: './public/assets/dist/emp_master.js',
        // project_master: './public/assets/dist/proj_master.js',

    },
    output: {
        path: path.resolve(__dirname, './public/assets/javascript'),
        filename: '[name].js',
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                include: [
                    path.resolve(__dirname, "./public/assets/dist/")
                  ], 
                use: 'babel-loader',
            },
            // for css
            {
                test: /\.css$/,
                exclude: /node_modules/,
                // include: [
                //     path.resolve(__dirname, "./public/assets/dist/")
                //   ], 
                use: ['style-loader','css-loader'],
            },

// for images
            {
             test: /\.(png|jpe?g|svg)$/,
             use: [{
                loader: "url-loader",
                options: {
                 limit: 5000
                }
               }]
             }
             
        ]
    },
    plugins: [
        new HtmlWebPackPlugin()
    ],
};


// npm install -D babel-loader @babel/core @babel/preset-env webpack