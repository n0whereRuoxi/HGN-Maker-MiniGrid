( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b791 - block
    b266 - block
    b194 - block
    b779 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b791 )
    ( on b266 b791 )
    ( on b194 b266 )
    ( on b779 b194 )
    ( clear b779 )
  )
  ( :goal
    ( and
      ( clear b791 )
    )
  )
)
