const { Sequelize } = require("sequelize-cockroachdb");
const sequelize = require("../core/db");
const event = sequelize.define("event", {
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
    date : {
        type : sequelize.DATETIME,
        allowNull: false,
    }
});

event.hasOne(user,{foreignKey: 'authorId', targetKey: 'uuid'});

