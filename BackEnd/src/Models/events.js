const { Sequelize } = require("sequelize-cockroachdb");
const sequelize = require("../core/db");


const events = sequelize.define("events", {
    uuid : {
        type: Sequelize.UUID,
        default : Sequelize.UUIDV4,
        primaryKey : true,
        allowNull : false
    },
    details : {
        type : Sequelize.TEXT,
        allowNull: true,
    },
    isEvent : {
        type : Sequelize.BOOLEAN,
        allowNull: false
    }
});


module.export = events;
