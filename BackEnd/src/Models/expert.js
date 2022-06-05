const { Sequelize } = require("sequelize-cockroachdb");

const sequelize = require("../core/db");


const expert = sequelize.define("expert", {
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
        type : Sequelize.CHAR(2048),
        defaultValue: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png",
    },
    interest : {
        type : Sequelize.STRING,
        allowNull : true
    },
    language : {
        type : Sequelize.STRING,
        allowNull : true
    },
    areaExpertise : {
        type : Sequelize.INTEGER,
        allowNull : true
    }

})

module.exports = expert;