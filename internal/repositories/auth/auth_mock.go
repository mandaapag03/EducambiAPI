package auth

import "github.com/stretchr/testify/mock"

type AuthRepository interface {
	GetUserPassword(username string) *string
}

type MockAuthRepository struct {
	mock.Mock
}

func (m *MockAuthRepository) GetUserPassword(username string) string {
	args := m.Called(username)
	if args.Get(0) == nil {
		return ""
	}
	return args.Get(0).(string)
}
