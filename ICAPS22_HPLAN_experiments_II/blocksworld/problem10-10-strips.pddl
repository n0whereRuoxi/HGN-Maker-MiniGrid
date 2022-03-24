( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b416 - block
    b647 - block
    b939 - block
    b550 - block
    b265 - block
    b267 - block
    b850 - block
    b106 - block
    b110 - block
    b76 - block
    b324 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b416 )
    ( on b647 b416 )
    ( on b939 b647 )
    ( on b550 b939 )
    ( on b265 b550 )
    ( on b267 b265 )
    ( on b850 b267 )
    ( on b106 b850 )
    ( on b110 b106 )
    ( on b76 b110 )
    ( on b324 b76 )
    ( clear b324 )
  )
  ( :goal
    ( and
      ( clear b416 )
    )
  )
)
