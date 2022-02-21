( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b257 - block
    b774 - block
    b151 - block
    b42 - block
    b717 - block
    b756 - block
    b204 - block
    b84 - block
    b34 - block
    b159 - block
    b253 - block
    b702 - block
    b155 - block
    b636 - block
    b615 - block
    b835 - block
    b208 - block
    b432 - block
    b599 - block
    b385 - block
    b398 - block
    b123 - block
    b127 - block
    b343 - block
    b530 - block
    b734 - block
    b471 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b257 )
    ( on b774 b257 )
    ( on b151 b774 )
    ( on b42 b151 )
    ( on b717 b42 )
    ( on b756 b717 )
    ( on b204 b756 )
    ( on b84 b204 )
    ( on b34 b84 )
    ( on b159 b34 )
    ( on b253 b159 )
    ( on b702 b253 )
    ( on b155 b702 )
    ( on b636 b155 )
    ( on b615 b636 )
    ( on b835 b615 )
    ( on b208 b835 )
    ( on b432 b208 )
    ( on b599 b432 )
    ( on b385 b599 )
    ( on b398 b385 )
    ( on b123 b398 )
    ( on b127 b123 )
    ( on b343 b127 )
    ( on b530 b343 )
    ( on b734 b530 )
    ( on b471 b734 )
    ( clear b471 )
  )
  ( :goal
    ( and
      ( clear b257 )
    )
  )
)
