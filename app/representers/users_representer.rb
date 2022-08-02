class UsersRepresenter
    def initialize(data)
        @data = data
    end

    def as_json
      if enumarable? @data
        data.map { |user| structure_with user }        
      else
        structure_with @data
      end
    end

    private

    attr_reader :data

    def structure_with user
      {
        id: user.id,
        name: user.name,
        email: user.email,
        is_author: user.is_author
      }
    end

    def enumarable? object
      object.methods.include? :each
    end
end