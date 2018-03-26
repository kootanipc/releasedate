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
    if release.date < Date.today.months_ago(1)
      released = '<div class="label label-default">1か月以上前</div>'
      release.pass = true
      release.save
    elsif release.date < Date.today
      released = '<div class="label label-success">発売済</div>'
      release.pass = true
      release.save
    else
      released = '<div class="label label-info">未発売</div>'
      release.pass = false
      release.save
    end
    released.html_safe
  end

end
