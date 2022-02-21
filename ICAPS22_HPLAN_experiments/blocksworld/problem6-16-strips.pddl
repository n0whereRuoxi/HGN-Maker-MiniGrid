( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b28 - block
    b268 - block
    b654 - block
    b317 - block
    b13 - block
    b556 - block
    b432 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b28 )
    ( on b268 b28 )
    ( on b654 b268 )
    ( on b317 b654 )
    ( on b13 b317 )
    ( on b556 b13 )
    ( on b432 b556 )
    ( clear b432 )
  )
  ( :goal
    ( and
      ( clear b28 )
      ( clear b28 )
      ( clear b28 )
      ( clear b28 )
      ( clear b28 )
      ( clear b28 )
      ( clear b28 )
    )
  )
)
