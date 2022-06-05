const { Sequelize } = require("sequelize-cockroachdb");

const sequelize = require("../core/db");


const explorer = sequelize.define("explorer", {
    uuid: {
        type: Sequelize.UUID,
        default : Sequelize.UUIDV4,
        primaryKey : true,
    },
    aboutYourself : {
        type : Sequelize.TEXT,
        allowNull: true,
    },
    profilePic : {
        type : Sequelize.CHAR,
        defaultValue: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png",
    },
    interest : {
        type : Sequelize.STRING,
        allowNull : true
    },
    language : {
        type : Sequelize.STRING,
        allowNull : true
    }

})

module.exports = explorer;