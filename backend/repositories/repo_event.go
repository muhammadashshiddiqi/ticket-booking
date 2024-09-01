package repositories

import (
	"context"
	"ticket-booking-app/models"

	"gorm.io/gorm"
)

type EventRepository struct {
	db *gorm.DB
}

func (r *EventRepository) RepoGetAllEvent(ctx context.Context) ([]*models.Event, error) {
	event := []*models.Event{}
	dataRes := r.db.Model(&models.Event{}).Order("updated_at DESC").Find(&event)

	if dataRes.Error != nil {
		return nil, dataRes.Error
	}
	return event, nil
}

func (r *EventRepository) RepoGetEvent(ctx context.Context, eventId uint) (*models.Event, error) {
	event := &models.Event{}

	dataRes := r.db.Model(event).Where("id=?", eventId).First(event)

	if dataRes.Error != nil {
		return nil, dataRes.Error
	}
	return event, nil
}

func (r *EventRepository) RepoCreateEvent(ctx context.Context, event *models.Event) (*models.Event, error) {
	createRes := r.db.Model(event).Create(event)

	if createRes.Error != nil {
		return nil, createRes.Error
	}

	return event, nil
}

func (r *EventRepository) RepoUpdateEvent(ctx context.Context, eventId uint, updateData map[string]interface{}) (*models.Event, error) {
	event := &models.Event{}

	updateRes := r.db.Model(event).Where("id = ?", eventId).Updates(updateData)
	if updateRes.Error != nil {
		return nil, updateRes.Error
	}

	getRes := r.db.Model(event).Where("id = ?", eventId).First(event)

	if getRes.Error != nil {
		return nil, getRes.Error
	}

	return event, nil
}

func (r *EventRepository) RepoDeleteEvent(ctx context.Context, eventId uint) error {
	res := r.db.Delete(&models.Event{}, eventId)
	return res.Error
}

func NewEventRepository(db *gorm.DB) models.EventRepo {
	return &EventRepository{
		db: db,
	}
}
