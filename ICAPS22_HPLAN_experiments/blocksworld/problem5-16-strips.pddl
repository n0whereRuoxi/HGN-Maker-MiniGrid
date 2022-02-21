( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b492 - block
    b556 - block
    b237 - block
    b64 - block
    b254 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b492 )
    ( on b556 b492 )
    ( on b237 b556 )
    ( on b64 b237 )
    ( on b254 b64 )
    ( on b946 b254 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b492 )
    )
  )
)
