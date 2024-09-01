package db

import (
	"ticket-booking-app/models"

	"gorm.io/gorm"
)

func DBMigrator(db *gorm.DB) error {
	//db.Migrator().DropTable(&models.Event{})
	return db.AutoMigrate(&models.Event{})
}
