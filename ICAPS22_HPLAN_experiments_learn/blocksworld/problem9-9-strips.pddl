( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b880 - block
    b83 - block
    b50 - block
    b536 - block
    b629 - block
    b864 - block
    b877 - block
    b545 - block
    b160 - block
    b913 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b880 )
    ( on b83 b880 )
    ( on b50 b83 )
    ( on b536 b50 )
    ( on b629 b536 )
    ( on b864 b629 )
    ( on b877 b864 )
    ( on b545 b877 )
    ( on b160 b545 )
    ( on b913 b160 )
    ( clear b913 )
  )
  ( :goal
    ( and
      ( clear b880 )
    )
  )
)
