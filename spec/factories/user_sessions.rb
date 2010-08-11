Factory.define :valid_login, :class => UserSession do |u|
  u.login "alan"
  u.password "pass"
  u.remember_me 0
end