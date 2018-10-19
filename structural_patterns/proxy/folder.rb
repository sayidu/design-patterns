class Folder
  def view_docs(username)
    puts "Showing all documents to: #{username}"
  end

  def add_a_doc(username)
    puts "#{username}: Adding a document"
  end

  def remove_a_doc(username)
    puts "#{username}: Removing a document"
  end
end
