( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b849 - block
    b731 - block
    b36 - block
    b914 - block
    b45 - block
    b891 - block
    b260 - block
    b641 - block
    b824 - block
    b437 - block
    b525 - block
    b88 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b849 )
    ( on b731 b849 )
    ( on b36 b731 )
    ( on b914 b36 )
    ( on b45 b914 )
    ( on b891 b45 )
    ( on b260 b891 )
    ( on b641 b260 )
    ( on b824 b641 )
    ( on b437 b824 )
    ( on b525 b437 )
    ( on b88 b525 )
    ( clear b88 )
  )
  ( :goal
    ( and
      ( clear b849 )
    )
  )
)
