( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b668 - block
    b451 - block
    b841 - block
    b724 - block
    b573 - block
    b220 - block
    b14 - block
    b863 - block
    b50 - block
    b870 - block
    b257 - block
    b966 - block
    b536 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b668 )
    ( on b451 b668 )
    ( on b841 b451 )
    ( on b724 b841 )
    ( on b573 b724 )
    ( on b220 b573 )
    ( on b14 b220 )
    ( on b863 b14 )
    ( on b50 b863 )
    ( on b870 b50 )
    ( on b257 b870 )
    ( on b966 b257 )
    ( on b536 b966 )
    ( clear b536 )
  )
  ( :goal
    ( and
      ( clear b668 )
    )
  )
)
