( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b256 - block
    b554 - block
    b730 - block
    b796 - block
    b35 - block
    b126 - block
    b30 - block
    b257 - block
    b200 - block
    b775 - block
    b53 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b256 )
    ( on b554 b256 )
    ( on b730 b554 )
    ( on b796 b730 )
    ( on b35 b796 )
    ( on b126 b35 )
    ( on b30 b126 )
    ( on b257 b30 )
    ( on b200 b257 )
    ( on b775 b200 )
    ( on b53 b775 )
    ( clear b53 )
  )
  ( :goal
    ( and
      ( clear b256 )
    )
  )
)
