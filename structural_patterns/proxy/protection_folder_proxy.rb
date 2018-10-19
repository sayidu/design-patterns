require_relative 'folder'

class ProtectionFolderProxy
  def initialize(real_folder, username, user_role)
    @real_folder = real_folder
    @username = username
    @user_role = user_role
  end

  def view_docs
    verify_access
    @real_folder.view_docs(@username)
  end

  def add_a_doc
    verify_access
    @real_folder.add_a_doc(@username)
  end

  def remove_a_doc
    verify_access
    @real_folder.remove_a_doc(@username)
  end

  private

  def verify_access
    return true if @user_role == 'admin'
  end
end

# [Run]
folder = Folder.new
user_name = 'janedoe'
protected_folder = ProtectionFolderProxy.new(folder, user_name, 'admin')
puts protected_folder.view_docs
puts protected_folder.add_a_doc
puts protected_folder.remove_a_doc
