( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b186 - block
    b98 - block
    b74 - block
    b434 - block
    b177 - block
    b445 - block
    b690 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b186 )
    ( on b98 b186 )
    ( on b74 b98 )
    ( on b434 b74 )
    ( on b177 b434 )
    ( on b445 b177 )
    ( on b690 b445 )
    ( clear b690 )
  )
  ( :goal
    ( and
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
      ( clear b186 )
    )
  )
)
