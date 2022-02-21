( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b556 - block
    b187 - block
    b874 - block
    b759 - block
    b827 - block
    b380 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b556 )
    ( on b187 b556 )
    ( on b874 b187 )
    ( on b759 b874 )
    ( on b827 b759 )
    ( on b380 b827 )
    ( clear b380 )
  )
  ( :goal
    ( and
      ( clear b556 )
    )
  )
)
