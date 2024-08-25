package db

import (
	"fmt"
	"log"
	"ticket-booking-app/config"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)


func Init(c *config.EnvConfig, DBMigrator func(*gorm.DB) error) *gorm.DB {
	uri := fmt.Sprintf(`host=%s user=%s dbname=%s password=%s sslmode=%s port=5432`, c.DBHost, c.DBUser, c.DBName, c.DBPassword, c.DBSSLMode)	


	db, err := gorm.Open(postgres.Open(uri), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})

	if err != nil {
		log.Fatalf("Unable to connect database: %v", err)
	}


	if err := DBMigrator(db); err != nil {
		log.Fatalf("Unable to migrate db : %v", err)
	}

	return db
}