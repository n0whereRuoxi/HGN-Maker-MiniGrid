( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b747 - block
    b434 - block
    b202 - block
    b686 - block
    b460 - block
    b73 - block
    b873 - block
    b849 - block
    b8 - block
    b489 - block
    b235 - block
    b840 - block
    b617 - block
    b23 - block
    b283 - block
    b689 - block
    b337 - block
    b242 - block
    b859 - block
    b348 - block
    b155 - block
    b741 - block
    b996 - block
    b161 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b747 )
    ( on b434 b747 )
    ( on b202 b434 )
    ( on b686 b202 )
    ( on b460 b686 )
    ( on b73 b460 )
    ( on b873 b73 )
    ( on b849 b873 )
    ( on b8 b849 )
    ( on b489 b8 )
    ( on b235 b489 )
    ( on b840 b235 )
    ( on b617 b840 )
    ( on b23 b617 )
    ( on b283 b23 )
    ( on b689 b283 )
    ( on b337 b689 )
    ( on b242 b337 )
    ( on b859 b242 )
    ( on b348 b859 )
    ( on b155 b348 )
    ( on b741 b155 )
    ( on b996 b741 )
    ( on b161 b996 )
    ( clear b161 )
  )
  ( :goal
    ( and
      ( clear b747 )
    )
  )
)
