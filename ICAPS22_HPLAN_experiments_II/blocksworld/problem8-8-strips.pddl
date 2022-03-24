( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b961 - block
    b402 - block
    b732 - block
    b877 - block
    b362 - block
    b859 - block
    b194 - block
    b863 - block
    b286 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b961 )
    ( on b402 b961 )
    ( on b732 b402 )
    ( on b877 b732 )
    ( on b362 b877 )
    ( on b859 b362 )
    ( on b194 b859 )
    ( on b863 b194 )
    ( on b286 b863 )
    ( clear b286 )
  )
  ( :goal
    ( and
      ( clear b961 )
    )
  )
)
