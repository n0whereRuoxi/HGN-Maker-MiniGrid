( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b895 - block
    b54 - block
    b632 - block
    b773 - block
    b18 - block
    b746 - block
    b141 - block
    b184 - block
    b865 - block
    b585 - block
    b663 - block
    b817 - block
    b290 - block
    b424 - block
    b534 - block
    b481 - block
    b123 - block
    b597 - block
    b438 - block
    b408 - block
    b978 - block
    b421 - block
    b918 - block
    b450 - block
    b311 - block
    b761 - block
    b241 - block
    b652 - block
    b980 - block
    b704 - block
    b848 - block
    b960 - block
    b242 - block
    b94 - block
    b703 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b895 )
    ( on b54 b895 )
    ( on b632 b54 )
    ( on b773 b632 )
    ( on b18 b773 )
    ( on b746 b18 )
    ( on b141 b746 )
    ( on b184 b141 )
    ( on b865 b184 )
    ( on b585 b865 )
    ( on b663 b585 )
    ( on b817 b663 )
    ( on b290 b817 )
    ( on b424 b290 )
    ( on b534 b424 )
    ( on b481 b534 )
    ( on b123 b481 )
    ( on b597 b123 )
    ( on b438 b597 )
    ( on b408 b438 )
    ( on b978 b408 )
    ( on b421 b978 )
    ( on b918 b421 )
    ( on b450 b918 )
    ( on b311 b450 )
    ( on b761 b311 )
    ( on b241 b761 )
    ( on b652 b241 )
    ( on b980 b652 )
    ( on b704 b980 )
    ( on b848 b704 )
    ( on b960 b848 )
    ( on b242 b960 )
    ( on b94 b242 )
    ( on b703 b94 )
    ( clear b703 )
  )
  ( :goal
    ( and
      ( clear b895 )
    )
  )
)
