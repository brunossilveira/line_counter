class BranchesHelper


  # Returns a list of branches selected for the issues
  def branches_list(branches)
    return [1,2,3,4,5,6]
    remove_allowed = User.current.allowed_to?("delete_#{object.class.name.underscore}_watchers".to_sym, object.project)
    content = ''.html_safe
    lis = object.watcher_users.collect do |user|
      s = ''.html_safe
      s << avatar(user, :size => "16").to_s
      s << link_to_user(user, :class => 'user')
      if remove_allowed
        url = {:controller => 'watchers',
               :action => 'destroy',
               :object_type => object.class.to_s.underscore,
               :object_id => object.id,
               :user_id => user}
        s << ' '
        s << link_to(image_tag('delete.png'), url,
                     :remote => true, :method => 'delete', :class => "delete")
      end
      content << content_tag('li', s, :class => "user-#{user.id}")
    end
    content.present? ? content_tag('ul', content, :class => 'watchers') : content
  end
end