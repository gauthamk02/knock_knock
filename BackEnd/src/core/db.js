const { Sequelize } = require("sequelize-cockroachdb");


const sequelize = new Sequelize(process.env.DATABASE_URL);

module.exports = sequelize;