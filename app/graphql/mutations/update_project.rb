module Mutations
  class UpdateProject < GraphQL::Schema::Mutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :public, Boolean, required: false

    type Types::ProjectType

    def resolve(id: nil, title: nil, description: nil, public: nil)
      user = context[:current_user]

      return unless user

      project = user.projects.find(id)

      project.update!(
        title: title,
        description: description,
        public: public,
      )

      project
    end
  end
end
