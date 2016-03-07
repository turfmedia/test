##
# Basic User model to manage simple CRUD actions

class User
  @@_id = 0
  @@_users = {}
  
  class << self
    def init
      @@_id = 0
    end

    def find(id)
      @@_users[id]
    end

    def create(user)
      id = next_id
      @@_users[id] = user
      return id
    end

    def update(id, user)
      @@_users[id] = user
    end

    def delete(id)
      @@_users.delete id
    end

    def all
      @@_users
    end

    private

    def next_id
      increment
      @@_id
    end

    def increment
      @@_id += 1
    end

  end
end
