( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b548 - block
    b188 - block
    b789 - block
    b879 - block
    b77 - block
    b25 - block
    b336 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b548 )
    ( on b188 b548 )
    ( on b789 b188 )
    ( on b879 b789 )
    ( on b77 b879 )
    ( on b25 b77 )
    ( on b336 b25 )
    ( clear b336 )
  )
  ( :goal
    ( and
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
      ( clear b548 )
    )
  )
)
