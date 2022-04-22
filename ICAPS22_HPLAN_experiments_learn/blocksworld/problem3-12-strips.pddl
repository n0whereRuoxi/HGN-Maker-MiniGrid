( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b669 - block
    b743 - block
    b543 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b669 )
    ( on b743 b669 )
    ( on b543 b743 )
    ( on b255 b543 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b669 )
    )
  )
)
