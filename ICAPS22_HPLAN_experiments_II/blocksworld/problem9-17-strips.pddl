( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b891 - block
    b683 - block
    b693 - block
    b40 - block
    b930 - block
    b502 - block
    b766 - block
    b147 - block
    b282 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b891 b91 )
    ( on b683 b891 )
    ( on b693 b683 )
    ( on b40 b693 )
    ( on b930 b40 )
    ( on b502 b930 )
    ( on b766 b502 )
    ( on b147 b766 )
    ( on b282 b147 )
    ( clear b282 )
  )
  ( :goal
    ( and
      ( clear b91 )
    )
  )
)
