package db

import (
	"ticket-booking-app/models"

	"gorm.io/gorm"
)

func DBMigrator(db *gorm.DB) error {
	//db.Migrator().DropTable(&models.Ticket{})
	return db.AutoMigrate(&models.Event{}, &models.Ticket{}, &models.User{})
}
