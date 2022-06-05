const { Sequelize } = require("sequelize-cockroachdb");

const sequelize = require("../core/db");


const user = sequelize.define("user", {
    uuid: {
        type: Sequelize.UUID,
        defaultValue : Sequelize.UUIDV4,
        primaryKey : true,
    },
    name : {
        type : Sequelize.STRING,
        allowNull: false,
    },
    phoneNumber : {
        type: Sequelize.STRING,
        allowNull : false
    },
    age : {
        type : Sequelize.INTEGER,
        allowNull: false,      
    },
    currentLocation : {
        type : Sequelize.STRING,
        allowNull : false,
    },
    type : {
        type : Sequelize.ENUM,
        values : ['expert', 'explorer']
    },
    password : {
        type : Sequelize.STRING,
        allowNull : false
    },
    
});


module.exports = user;