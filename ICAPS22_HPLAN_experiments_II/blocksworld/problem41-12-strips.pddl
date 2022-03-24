( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b773 - block
    b616 - block
    b687 - block
    b799 - block
    b264 - block
    b91 - block
    b451 - block
    b853 - block
    b57 - block
    b614 - block
    b531 - block
    b367 - block
    b789 - block
    b689 - block
    b257 - block
    b27 - block
    b454 - block
    b289 - block
    b18 - block
    b998 - block
    b424 - block
    b262 - block
    b389 - block
    b233 - block
    b909 - block
    b719 - block
    b405 - block
    b804 - block
    b171 - block
    b485 - block
    b602 - block
    b655 - block
    b860 - block
    b549 - block
    b633 - block
    b47 - block
    b232 - block
    b276 - block
    b899 - block
    b581 - block
    b151 - block
    b498 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b773 )
    ( on b616 b773 )
    ( on b687 b616 )
    ( on b799 b687 )
    ( on b264 b799 )
    ( on b91 b264 )
    ( on b451 b91 )
    ( on b853 b451 )
    ( on b57 b853 )
    ( on b614 b57 )
    ( on b531 b614 )
    ( on b367 b531 )
    ( on b789 b367 )
    ( on b689 b789 )
    ( on b257 b689 )
    ( on b27 b257 )
    ( on b454 b27 )
    ( on b289 b454 )
    ( on b18 b289 )
    ( on b998 b18 )
    ( on b424 b998 )
    ( on b262 b424 )
    ( on b389 b262 )
    ( on b233 b389 )
    ( on b909 b233 )
    ( on b719 b909 )
    ( on b405 b719 )
    ( on b804 b405 )
    ( on b171 b804 )
    ( on b485 b171 )
    ( on b602 b485 )
    ( on b655 b602 )
    ( on b860 b655 )
    ( on b549 b860 )
    ( on b633 b549 )
    ( on b47 b633 )
    ( on b232 b47 )
    ( on b276 b232 )
    ( on b899 b276 )
    ( on b581 b899 )
    ( on b151 b581 )
    ( on b498 b151 )
    ( clear b498 )
  )
  ( :goal
    ( and
      ( clear b773 )
    )
  )
)
