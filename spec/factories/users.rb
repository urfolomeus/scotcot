Factory.define :valid_user, :class => User do |u|
  u.login "alan"
  u.password "pass"
  u.password_confirmation "pass"
  u.email "alan@scotcot.com"
end

Factory.define :invalid_user, :class => User do |u|
end