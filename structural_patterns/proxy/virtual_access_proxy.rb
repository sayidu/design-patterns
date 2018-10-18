require_relative 'folder'

class VirtualAccessProxy
  def view_docs(user_name)
    folder.view_docs(user_name)
  end

  def add_a_doc(user_name)
    folder.add_a_doc(user_name)
  end

  def remove_a_doc(user_name)
    folder.remove_a_doc(user_name)
  end

  private

  def folder
    @folder ||= Folder.new
  end
end

# [Run]
user_name = 'janedoe'
virtual_folder = VirtualAccessProxy.new
puts virtual_folder.view_docs(user_name)
puts virtual_folder.add_a_doc(user_name)
puts virtual_folder.remove_a_doc(user_name)
