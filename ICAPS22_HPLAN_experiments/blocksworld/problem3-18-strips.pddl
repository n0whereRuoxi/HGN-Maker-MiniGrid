( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b257 - block
    b549 - block
    b304 - block
    b391 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b257 )
    ( on b549 b257 )
    ( on b304 b549 )
    ( on b391 b304 )
    ( clear b391 )
  )
  ( :goal
    ( and
      ( clear b257 )
    )
  )
)
