( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b239 - block
    b237 - block
    b376 - block
    b722 - block
    b240 - block
    b1 - block
    b190 - block
    b619 - block
    b260 - block
    b547 - block
    b994 - block
    b571 - block
    b894 - block
    b594 - block
    b74 - block
    b114 - block
    b775 - block
    b265 - block
    b107 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b239 )
    ( on b237 b239 )
    ( on b376 b237 )
    ( on b722 b376 )
    ( on b240 b722 )
    ( on b1 b240 )
    ( on b190 b1 )
    ( on b619 b190 )
    ( on b260 b619 )
    ( on b547 b260 )
    ( on b994 b547 )
    ( on b571 b994 )
    ( on b894 b571 )
    ( on b594 b894 )
    ( on b74 b594 )
    ( on b114 b74 )
    ( on b775 b114 )
    ( on b265 b775 )
    ( on b107 b265 )
    ( clear b107 )
  )
  ( :goal
    ( and
      ( clear b239 )
    )
  )
)
