( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b264 - block
    b983 - block
    b654 - block
    b698 - block
    b175 - block
    b426 - block
    b475 - block
    b449 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b264 )
    ( on b983 b264 )
    ( on b654 b983 )
    ( on b698 b654 )
    ( on b175 b698 )
    ( on b426 b175 )
    ( on b475 b426 )
    ( on b449 b475 )
    ( clear b449 )
  )
  ( :goal
    ( and
      ( clear b264 )
    )
  )
)
