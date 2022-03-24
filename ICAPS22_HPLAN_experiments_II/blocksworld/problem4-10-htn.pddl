( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b256 - block
    b311 - block
    b801 - block
    b972 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b256 )
    ( on b311 b256 )
    ( on b801 b311 )
    ( on b972 b801 )
    ( on b946 b972 )
    ( clear b946 )
  )
  ( :tasks
    ( Make-4Pile b311 b801 b972 b946 )
  )
)
