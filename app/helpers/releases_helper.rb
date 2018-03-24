module ReleasesHelper
  #diveを参考
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_releases_path
    elsif action_name == 'edit'
      release_path
    end
  end

  #発売日を過ぎている場合、"済"を表示する
  def released_flg(release)
    released = ""
#    today = Time.now
#    if release.date < today
#      released = "済"
#    else
#      released = "未発売"
#    end
#    result.html_safe
  end
end
