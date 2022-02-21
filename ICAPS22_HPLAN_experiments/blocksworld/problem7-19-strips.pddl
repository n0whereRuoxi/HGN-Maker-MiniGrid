( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b749 - block
    b200 - block
    b608 - block
    b755 - block
    b721 - block
    b747 - block
    b459 - block
    b195 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b749 )
    ( on b200 b749 )
    ( on b608 b200 )
    ( on b755 b608 )
    ( on b721 b755 )
    ( on b747 b721 )
    ( on b459 b747 )
    ( on b195 b459 )
    ( clear b195 )
  )
  ( :goal
    ( and
      ( clear b749 )
    )
  )
)
