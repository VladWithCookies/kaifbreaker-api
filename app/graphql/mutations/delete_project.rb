module Mutations
  class DeleteProject < GraphQL::Schema::Mutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(id: nil)
      user = context[:current_user]

      return unless user

      user.projects.destroy(id)
    end
  end
end
