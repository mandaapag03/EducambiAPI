package auth

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestLogin(t *testing.T) {
	tests := []struct {
		username string
		password string
		expected bool
	}{
		{"mandaaa", "123456", true},
		{"lucas", "12456", false},
		{"bla", "12456", true},
		{"x", "", false},
	}
	for _, test := range tests {
		t.Run(test.username, func(t *testing.T) {
			mockAuth := new(MockAuthRepository)
			mockAuth.On("GetUserPassword", test.username).Return(test.password)
			result := Login(test.username, test.password)
			assert.Equal(t, test.expected, result)
		})
	}
}
