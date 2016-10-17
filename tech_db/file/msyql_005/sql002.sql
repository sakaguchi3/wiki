update  mydb.mytable g

set
      g.modified = now()
    , g.modifier=501
    , g.name = replace(g.name, '\n', '')

where 1
  and 0 # 更新時にコメントアウト
  and g.name like '%\n%'
  and g.delete_flg=0


;