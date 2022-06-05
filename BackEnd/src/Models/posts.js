const { Sequelize } = require("sequelize-cockroachdb");
const sequelize = require("../core/db");


const posts = sequelize.define("posts", {
    uuid : {
        type: Sequelize.UUID,
        default : Sequelize.UUIDV4,
        primaryKey : true,
    },
    details : {
        type : Sequelize.TEXT,
        allowNull: true,
    },
    isEvent : {
        type : Sequelize.BOOLEAN,
        allowNull: false
    }
})

module.exports = posts;
