( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b960 - block
    b974 - block
    b306 - block
    b525 - block
    b376 - block
    b687 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b960 )
    ( on b974 b960 )
    ( on b306 b974 )
    ( on b525 b306 )
    ( on b376 b525 )
    ( on b687 b376 )
    ( clear b687 )
  )
  ( :goal
    ( and
      ( clear b960 )
    )
  )
)
