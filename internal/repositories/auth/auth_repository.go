package auth

var users = map[string]string{"mandaaa": "123456", "andre": "123456", "rafael": "123456", "joao": "123456", "maria": "123456", "jose": "123456", "ana": "123456", "luan": "123456", "lucas": "123456"}

func Login(username string, password string) bool {
	userPassword := GetUserPassword(username)
	if password == "" || userPassword != password {
		return false
	}
	return true
}

func GetUserPassword(username string) string {
	if password, ok := users[username]; ok {
		return password
	}
	return ""
}
