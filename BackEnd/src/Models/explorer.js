const Sequelize = require("sequelize");

const sequelize = require("../core/db");


const explorer = sequelize.define("explorer", {
    uuid: {
        type : Sequelize.UUID,
        defaultValue : Sequelize.UUIDV4,
    },
    aboutYourself : {
        type : Sequelize.TEXT,
        allowNull: true,
    },
    profilePic : {
        type : Sequelize.CHAR(2048),
        defaultValue: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png",
    },
    interest : {
        type : Sequelize.STRING,
        allowNull : false
    },
    language : {
        type : Sequelize.STRING,
        allowNull : false
    }

})

module.exports = explorer;