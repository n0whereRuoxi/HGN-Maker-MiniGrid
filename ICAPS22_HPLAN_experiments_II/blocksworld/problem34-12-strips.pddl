( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b984 - block
    b577 - block
    b243 - block
    b925 - block
    b251 - block
    b930 - block
    b131 - block
    b353 - block
    b944 - block
    b660 - block
    b754 - block
    b477 - block
    b622 - block
    b662 - block
    b127 - block
    b755 - block
    b1 - block
    b252 - block
    b683 - block
    b43 - block
    b300 - block
    b22 - block
    b791 - block
    b67 - block
    b161 - block
    b710 - block
    b569 - block
    b498 - block
    b604 - block
    b812 - block
    b371 - block
    b380 - block
    b378 - block
    b383 - block
    b784 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b984 )
    ( on b577 b984 )
    ( on b243 b577 )
    ( on b925 b243 )
    ( on b251 b925 )
    ( on b930 b251 )
    ( on b131 b930 )
    ( on b353 b131 )
    ( on b944 b353 )
    ( on b660 b944 )
    ( on b754 b660 )
    ( on b477 b754 )
    ( on b622 b477 )
    ( on b662 b622 )
    ( on b127 b662 )
    ( on b755 b127 )
    ( on b1 b755 )
    ( on b252 b1 )
    ( on b683 b252 )
    ( on b43 b683 )
    ( on b300 b43 )
    ( on b22 b300 )
    ( on b791 b22 )
    ( on b67 b791 )
    ( on b161 b67 )
    ( on b710 b161 )
    ( on b569 b710 )
    ( on b498 b569 )
    ( on b604 b498 )
    ( on b812 b604 )
    ( on b371 b812 )
    ( on b380 b371 )
    ( on b378 b380 )
    ( on b383 b378 )
    ( on b784 b383 )
    ( clear b784 )
  )
  ( :goal
    ( and
      ( clear b984 )
    )
  )
)
