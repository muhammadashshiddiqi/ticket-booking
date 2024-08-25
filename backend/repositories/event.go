package repositories

import (
	"context"
	"ticket-booking-app/models"
	"time"
)

type EventRepository struct {
	db any
}

func (repo *EventRepository) GetMany(ctx context.Context) ([]* models.Event, error) {
	lsData := []*models.Event{}

	lsData = append(lsData, &models.Event{
		ID: "ABCD987654",
		NIN: "123456789101112",
		Name: "Muhammad Ashshiddiqi",
		Location: "DKI Jakarta, Cempaka Putih",
		Date: time.Now(),
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	})

	return lsData, nil
}

func (repo * EventRepository) GetOne(ctx context.Context, eventId string) (*models.Event, error) {
	return nil, nil
}

func (repo *EventRepository) CreateOne(ctx context.Context, event models.Event) (*models.Event, error){
	return nil, nil
}

func NewEventRepository(db any) models.EventRepository {
	return &EventRepository{
		db: db,
	}
}