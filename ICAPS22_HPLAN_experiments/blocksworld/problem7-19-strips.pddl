( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b4 - block
    b67 - block
    b373 - block
    b814 - block
    b196 - block
    b266 - block
    b458 - block
    b51 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b4 )
    ( on b67 b4 )
    ( on b373 b67 )
    ( on b814 b373 )
    ( on b196 b814 )
    ( on b266 b196 )
    ( on b458 b266 )
    ( on b51 b458 )
    ( clear b51 )
  )
  ( :goal
    ( and
      ( clear b4 )
    )
  )
)
