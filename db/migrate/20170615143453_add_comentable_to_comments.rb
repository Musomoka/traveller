class AddComentableToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
