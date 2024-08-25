package db

import (
	"ticket-booking-app/models"

	"gorm.io/gorm"
)



func DBMigrate(db *gorm.DB) error {
	return db.AutoMigrate(&models.Event{})
}