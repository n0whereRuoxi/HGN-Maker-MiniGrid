( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b735 - block
    b712 - block
    b377 - block
    b320 - block
    b101 - block
    b796 - block
    b190 - block
    b243 - block
    b584 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b735 )
    ( on b712 b735 )
    ( on b377 b712 )
    ( on b320 b377 )
    ( on b101 b320 )
    ( on b796 b101 )
    ( on b190 b796 )
    ( on b243 b190 )
    ( on b584 b243 )
    ( clear b584 )
  )
  ( :goal
    ( and
      ( clear b735 )
    )
  )
)
