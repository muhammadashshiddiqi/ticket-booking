package repositories

import (
	"context"
	"ticket-booking-app/models"

	"gorm.io/gorm"
)

type TicketRepository struct {
	db *gorm.DB
}

// CreateTicket implements models.TicketRepo.
func (r TicketRepository) CreateTicket(ctx context.Context, ticket *models.Ticket) (*models.Ticket, error) {
	res := r.db.Model(ticket).Create(ticket)

	if res.Error != nil {
		return nil, res.Error
	}

	return r.GetMyTicket(ctx, ticket.ID)
}

// GetAllTicket implements models.TicketRepo.
func (r TicketRepository) GetAllTicket(ctx context.Context) ([]*models.Ticket, error) {
	tickets := []*models.Ticket{}

	res := r.db.Model(&models.Ticket{}).Preload("Event").Order("updated_at DESC").Find(tickets)
	if res.Error != nil {
		return nil, res.Error
	}

	return tickets, nil
}

// GetMyTicket implements models.TicketRepo.
func (r TicketRepository) GetMyTicket(ctx context.Context, ticketId uint) (*models.Ticket, error) {
	ticket := &models.Ticket{}

	res := r.db.Model(ticket).Where("id=?", ticketId).Preload("Event").First(ticket)

	if res.Error != nil {
		return nil, res.Error
	}

	return ticket, nil
}


func (r *TicketRepository) UpdateMyTicket(ctx context.Context, ticketId uint, updateData map[string]interface{}) (*models.Ticket, error) {
	ticket := &models.Ticket{}

	updateRes := r.db.Model(ticket).Where("id = ?", ticketId).Updates(updateData)

	if updateRes.Error != nil {
		return nil, updateRes.Error
	}

	return r.GetMyTicket(ctx, ticketId)
}

func NewTicketRepository(db *gorm.DB) models.TicketRepo {
	return &TicketRepository{
		db: db,
	}
}
