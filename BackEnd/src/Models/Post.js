const { Sequelize } = require("sequelize-cockroachdb");
const sequelize = require("../core/db");
const post = sequelize.define("event", {
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
    },
    isEvent : {
        type : Sequelize.BOOLEAN,
        allowNull: false
    }
});

post.hasOne(user,{foreignKey: 'authorId', targetKey: 'uuid'});

